import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/configs/singleton_locator.dart';
import 'package:pokedex_scaffold/core/base/base_bloc.dart';
import 'package:pokedex_scaffold/core/services/http/http_exceptions.dart';
import 'package:pokedex_scaffold/core/services/toast_service.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/common/ws_bloc_container.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_circular_progress_indicator.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_ws_error.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_ws_no_list_data_found.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_ws_refresh_indicator.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';
import 'package:pokedex_scaffold/utils/extensions/string.dart';

class PokedexScaffoldWsBlocContainer<C extends BaseWsCubit<S>, S extends BaseWsState>
    extends WsBlocContainer<C, S> {
  PokedexScaffoldWsBlocContainer({
    super.key,
    Widget? loadingChild,
    Widget Function(BuildContext, dynamic)? errorChildBuilder,
    String? errorMessage,
    void Function()? errorRetryCallback,
    required super.dataChildBuilder,
    String? noListDataFoundMessage,
    Future<void> Function()? dataRefreshCallback,
    FutureOr<void> Function(BuildContext, BaseWsState)? listener,
    super.buildWhen,
    super.listenWhen,
    super.prioritiseDataWhenAvailable,
    super.initialLoadCallback,
  }) : super(
          listener: (context, state) async {
            if (listener != null) {
              await listener(context, state);
            }

            if (state.error != null) {
              final exception = state.error;

              if (context.mounted) {
                if (exception is NetworkUnavailableException) {
                  locator<ToastService>().showToast(
                    context,
                    body: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.wifi_off,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 10.w),
                          child: Text(
                            context.localization.youAreOffline.capitalize(),
                            style: AppTheme.s16w600h20cWhite(context),
                          ),
                        ),
                      ],
                    ),
                    backgroundColor: AppTheme.primary(context),
                  );
                } else if (exception.error is SocketException || exception is TimeoutException) {
                  locator<ToastService>()
                      .showInfoToast(context, text: context.localization.connectionError);
                } else if (exception is UnauthorizedException) {
                  locator<ToastService>()
                      .showInfoToast(context, text: context.localization.sessionError);
                  AutoRouter.of(context).popUntilRoot();

                  // TODO: push to a login route
                  // AutoRouter.of(context).replace(const LoginRoute());
                }
              }
            }
          },
          loadingChild: loadingChild ??
              Center(
                child: PokedexScaffoldCircularProgressIndicator(),
              ),
          errorChildBuilder: (context, error) => errorChildBuilder != null
              ? errorChildBuilder(context, error)
              : PokedexScaffoldWsError(
                  padding: AppTheme.sidePadding.add(AppTheme.defaultTopPadding),
                  buttonPadding: const EdgeInsets.only(top: 30).h,
                  message: errorMessage ?? context.localization.genericError,
                  retryCallback: errorRetryCallback,
                ),
          noListDataChildBuilder: noListDataFoundMessage != null
              ? (context) => PokedexScaffoldWsNoListDataFound(
                    message: noListDataFoundMessage,
                    padding: AppTheme.sidePadding.add(AppTheme.defaultTopPadding),
                  )
              : null,
          reloadRefreshIndicatorBuilder: dataRefreshCallback != null
              ? (context, child) => PokedexScaffoldWsRefreshIndicator(
                    onRefresh: dataRefreshCallback,
                    child: child,
                  )
              : null,
        );
}
