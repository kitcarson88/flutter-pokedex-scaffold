import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_scaffold/core/models/dto/pokemon_dto.dart';
import 'package:pokedex_scaffold/ui/views/detail_view.dart';
import 'package:pokedex_scaffold/ui/views/main_tabs_view.dart';
import 'package:pokedex_scaffold/ui/views/root_routing_example_view.dart';
import 'package:pokedex_scaffold/ui/views/tabs/favorites_view.dart';
import 'package:pokedex_scaffold/ui/views/tabs/home_view.dart';
import 'package:pokedex_scaffold/ui/views/tabs/settings_view.dart';
import 'package:pokedex_scaffold/ui/views/tabs/use_cases/nested_routing_example_view.dart';
import 'package:pokedex_scaffold/ui/views/tabs/use_cases/use_cases_view.dart';
import 'package:pokedex_scaffold/ui/views/tabs/use_cases_routing_view.dart';

part 'router.gr.dart';

@singleton
@AutoRouterConfig(
  replaceInRouteName: 'View,Route',
)
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: MainTabsRoute.page,
      path: '/',
      children: [
        AutoRoute(page: HomeRoute.page, path: 'home'),
        AutoRoute(page: FavoritesRoute.page, path: 'favorites'),
        AutoRoute(
          page: UseCasesRoutingRoute.page,
          path: 'use-cases',
          children: [
            AutoRoute(page: UseCasesRoute.page, path: ''),
            AutoRoute(page: NestedRoutingExampleRoute.page, path: 'routing-example'),
          ],
        ),
        AutoRoute(page: SettingsRoute.page, path: 'settings'),
        RedirectRoute(path: '', redirectTo: 'home'),
      ],
    ),
    AutoRoute(page: DetailRoute.page, path: '/pokemon-detail'),
    AutoRoute(page: RootRoutingExampleRoute.page, path: '/routing-example'),
  ];
}
