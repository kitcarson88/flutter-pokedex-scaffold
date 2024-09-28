import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:logging/logging.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_circular_progress_indicator.dart';

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

class AppBuilder extends StatefulWidget {
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
  Widget build(BuildContext context) => LoaderOverlay(
        duration: const Duration(milliseconds: 250),
        reverseDuration: const Duration(milliseconds: 250),
        closeOnBackButton: false,
        disableBackButton: true,
        overlayColor: AppTheme.l44000000d44AAAAAA(context),
        overlayWidgetBuilder: (_) => Center(
          child: PokedexScaffoldCircularProgressIndicator(),
        ),
        child: widget.child,
      );
}
