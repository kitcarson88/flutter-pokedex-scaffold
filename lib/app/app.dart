import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:pokedex_scaffold/app/app_builder.dart';
import 'package:pokedex_scaffold/app/router.dart';
import 'package:pokedex_scaffold/bloc/settings/settings_cubit.dart';
import 'package:pokedex_scaffold/configs/flavors.dart';
import 'package:pokedex_scaffold/configs/singleton_locator.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';

class App extends HookWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = locator<AppRouter>();

    final cubit = useBloc<SettingsCubit>();
    final state = useBlocBuilder(cubit);

    return MaterialApp.router(
      title: F.title,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: state.locale,
      theme: AppTheme.lightMaterialTheme,
      darkTheme: AppTheme.darkMaterialTheme,
      themeMode: state.theme,
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
