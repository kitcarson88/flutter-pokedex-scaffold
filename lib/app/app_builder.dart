import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:logging/logging.dart';
import 'package:pokedex_scaffold/bloc/cubit/network_status_cubit.dart';
import 'package:pokedex_scaffold/configs/flavors.dart';
import 'package:pokedex_scaffold/configs/singleton_locator.dart';
import 'package:pokedex_scaffold/core/services/toast_service.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_circular_progress_indicator.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';
import 'package:pokedex_scaffold/utils/extensions/string.dart';

Widget appBuilder(BuildContext context, Widget? child) {
  ScreenUtil.init(
    context,
    designSize: const Size(411, 960),
    minTextAdapt: true,
    splitScreenMode: true,
  );

  final builder = AppBuilder(child: child!);

  return builder;
}

class AppBuilder extends StatefulHookWidget {
  final Widget child;

  const AppBuilder({
    super.key,
    required this.child,
  });

  @override
  State<AppBuilder> createState() => _AppBuilderState();
}

class _AppBuilderState extends State<AppBuilder> with WidgetsBindingObserver {
  final _logger = Logger('_AppBuilderState');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    locator<NetworkStatusCubit>().initConnectivityMonitoring();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _logger.fine('app changed lyfecycle state: $state');

    switch (state) {
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        _logger.fine('The app went in background');
        break;
      case AppLifecycleState.resumed:
        _logger.fine('The app was resumed');
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<NetworkStatusCubit>();
    useBlocComparativeListener(
      cubit,
      (_, state, context) {
        locator<ToastService>().showToast(
          context,
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                state.connected ? Icons.wifi : Icons.wifi_off,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 10.w),
                child: Text(
                  state.connected
                      ? context.localization.youAreOnlineAgain.capitalize()
                      : context.localization.youAreOffline.capitalize(),
                  style: AppTheme.s16w600h20cWhite(context),
                ),
              ),
            ],
          ),
          backgroundColor: AppTheme.primary(context),
        );
      },
      listenWhen: (NetworkStatusState previous, NetworkStatusState current) =>
          previous.connected != current.connected,
    );

    Widget child = widget.child;

    if (!F.isProd() && !kReleaseMode) {
      child = Banner(
        location: BannerLocation.topStart,
        message: F.name.toUpperCase(),
        color: F.color,
        textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 10.0, letterSpacing: 1.0),
        textDirection: TextDirection.ltr,
        child: child,
      );
    }

    return LoaderOverlay(
      duration: const Duration(milliseconds: 250),
      reverseDuration: const Duration(milliseconds: 250),
      closeOnBackButton: false,
      disableBackButton: true,
      overlayColor: AppTheme.l44000000d44AAAAAA(context),
      overlayWidgetBuilder: (_) => Center(
        child: PokedexScaffoldCircularProgressIndicator(),
      ),
      child: child,
    );
  }
}
