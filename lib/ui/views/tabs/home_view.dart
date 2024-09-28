import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/app/router.dart';
import 'package:pokedex_scaffold/core/base/base_view.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';
import 'package:pokedex_scaffold/utils/extensions/string.dart';

@RoutePage()
class HomeView extends BaseStatelessView {
  HomeView({
    super.key,
  }) : super(
          baseViewData: BaseViewData(
            appBarConfiguration: AppBarData(
              titleBuilder: (context) => context.localization.pokedex.capitalize(),
            ),
          ),
        );

  @override
  Widget body(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Home view'),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextButton(
                onPressed: () {
                  AutoRouter.of(context).push(const DetailRoute());
                },
                child: const Text('Press to go to child view'),
              ),
            ),
          ],
        ),
      );
}
