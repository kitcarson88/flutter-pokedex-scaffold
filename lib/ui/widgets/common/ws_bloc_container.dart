import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:pokedex_scaffold/core/base/base_bloc.dart';
import 'package:pokedex_scaffold/ui/widgets/common/ws_no_list_data_found.dart';
import 'package:pokedex_scaffold/ui/widgets/common/ws_refresh_indicator.dart';

class WsBlocContainer<C extends BaseWsCubit<S>, S extends BaseWsState> extends HookWidget {
  final Widget? loadingChild;
  final Widget Function(BuildContext context, dynamic error)? errorChildBuilder;
  final Widget Function(dynamic data, [bool? loading]) dataChildBuilder;
  final WsNoListDataFound Function(BuildContext context)? noListDataChildBuilder;
  final WsRefreshIndicator Function(BuildContext context, Widget child)?
      reloadRefreshIndicatorBuilder;
  final FutureOr<void> Function(BuildContext, BaseWsState)? listener;
  final bool Function(BaseWsState<dynamic>, BaseWsState<dynamic>)? buildWhen;
  final bool Function(BaseWsState<dynamic>, BaseWsState<dynamic>)? listenWhen;
  final bool prioritiseDataWhenAvailable;
  final void Function()? initialLoadCallback;

  const WsBlocContainer({
    super.key,
    this.loadingChild,
    this.errorChildBuilder,
    required this.dataChildBuilder,
    this.noListDataChildBuilder,
    this.reloadRefreshIndicatorBuilder,
    this.listener,
    this.buildWhen,
    this.listenWhen,
    this.prioritiseDataWhenAvailable = false,
    this.initialLoadCallback,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<C>();

    if (listener != null) {
      if (listenWhen != null) {
        useBlocComparativeListener(
          cubit,
          (C cubit, S value, BuildContext context) {
            listener!(context, value);
          },
          listenWhen: (S previous, S current) => listenWhen!(previous, current),
        );
      } else {
        useBlocListener(
          cubit,
          (C cubit, S value, BuildContext context) {
            listener!(context, value);
          },
        );
      }
    }

    final state = buildWhen != null
        ? useBlocComparativeBuilder(
            cubit,
            buildWhen: (S previous, S current) => buildWhen!(previous, current),
          )
        : useBlocBuilder(cubit);

    if (loadingChild != null &&
        ((state.loading && !prioritiseDataWhenAvailable) ||
            (state.loading && prioritiseDataWhenAvailable && state.data == null))) {
      return loadingChild!;
    }
    if (errorChildBuilder != null &&
        ((state.error != null && !prioritiseDataWhenAvailable) ||
            (state.error != null && prioritiseDataWhenAvailable && state.data == null))) {
      return errorChildBuilder != null ? errorChildBuilder!(context, state.error) : Container();
    }
    if (state.data != null) {
      if (state.data is List) {
        final body = state.data.isEmpty && noListDataChildBuilder != null
            ? noListDataChildBuilder!(context)
            : dataChildBuilder(state.data, state.loading);

        return reloadRefreshIndicatorBuilder != null
            ? reloadRefreshIndicatorBuilder!(context, body)
            : body;
      } else {
        return reloadRefreshIndicatorBuilder != null
            ? reloadRefreshIndicatorBuilder!(context, dataChildBuilder(state.data, state.loading))
            : dataChildBuilder(state.data, state.loading);
      }
    }

    if (initialLoadCallback != null) {
      initialLoadCallback!();
    }
    return Container();
  }
}
