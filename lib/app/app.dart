import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pokedex_scaffold/app/app_builder.dart';
import 'package:pokedex_scaffold/app/router.dart';
import 'package:pokedex_scaffold/configs/flavors.dart';
import 'package:pokedex_scaffold/configs/singleton_locator.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = locator<AppRouter>();

    return MaterialApp.router(
      title: F.title,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: null,
      theme: AppTheme.lightMaterialTheme,
      darkTheme: AppTheme.darkMaterialTheme,
      themeMode: ThemeMode.system,
      builder: appBuilder,
      routerDelegate: AutoRouterDelegate(appRouter),
      routeInformationParser: appRouter.defaultRouteParser(),
      routeInformationProvider: AutoRouteInformationProvider(),
      debugShowCheckedModeBanner: true,
      debugShowMaterialGrid: false,
      showPerformanceOverlay: false,
      showSemanticsDebugger: false,
    );
  }
}
