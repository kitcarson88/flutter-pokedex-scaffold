import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/app/app_builder.dart';
import 'package:pokedex_scaffold/app/router.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();

    return MaterialApp.router(
      title: 'Pokedex scaffold',
      theme: AppTheme.lightMaterialTheme,
      darkTheme: AppTheme.darkMaterialTheme,
      themeMode: ThemeMode.system,
      builder: appBuilder,
      routerDelegate: AutoRouterDelegate(appRouter),
      routeInformationParser: appRouter.defaultRouteParser(),
      routeInformationProvider: AutoRouteInformationProvider(),
    );
  }
}
