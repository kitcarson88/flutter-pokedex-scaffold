// ignore_for_file: always_use_package_imports

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:pokedex_scaffold/configs/logger.dart';
import 'package:pokedex_scaffold/configs/responsiveness_utils.dart';
import 'package:pokedex_scaffold/configs/singleton_locator.dart';

import 'configs/configure_nonweb.dart' if (dart.library.html) 'configs/configure_web.dart';

class AppBlocObserver extends BlocObserver {
  static final _log = Logger('AppBlocObserver');

  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    _log.fine(
        '[${bloc.runtimeType} change state] current: ${change.currentState} -> next: ${change.nextState})');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    _log.severe('[${bloc.runtimeType} error occurred] error: $error, stacktrace: $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      if (!kIsWeb) {
        await configureResponsivenessUtils();
      }
      setupLocator();
      configureWeb();
      configureLogger();

      FlutterError.onError = (details) {
        log(details.exceptionAsString(), stackTrace: details.stack);
      };

      Bloc.observer = const AppBlocObserver();

      //Setting SysemUIOverlay
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemStatusBarContrastEnforced: true,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ));

      //Setting SystmeUIMode
      // Android only to let scaffold and safe areas to manage as iOS
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      runApp(await builder());
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
