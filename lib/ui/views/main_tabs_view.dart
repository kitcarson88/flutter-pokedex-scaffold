import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex_scaffold/app/router.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_bottom_bar.dart';

@RoutePage()
class MainTabsView extends StatelessWidget {
  const MainTabsView({super.key});

  @override
  Widget build(BuildContext context) => AutoTabsRouter(
        routes: [
          HomeRoute(),
          FavoritesRoute(),
          const UseCasesRoutingRoute(),
          SettingsRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);

          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              systemStatusBarContrastEnforced: true,
              systemNavigationBarColor: Colors.transparent,
              systemNavigationBarDividerColor: Colors.transparent,
              systemNavigationBarIconBrightness: Brightness.light,
              systemNavigationBarContrastEnforced: true,
            ),
            child: Scaffold(
              extendBody: true,
              bottomNavigationBar: PokedexScaffoldBottomBar(
                onItemTap: tabsRouter.setActiveIndex,
              ),
              body: child,
            ),
          );
        },
      );
}
