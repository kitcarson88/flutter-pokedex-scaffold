import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/core/base/base_view.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';
import 'package:pokedex_scaffold/utils/extensions/string.dart';

@RoutePage()
class SettingsView extends BaseStatelessView {
  SettingsView({super.key})
      : super(
          baseViewData: BaseViewData(
            appBarConfiguration: AppBarData(
              titleBuilder: (context) => context.localization.settings.capitalize(),
            ),
          ),
        );

  @override
  Widget body(BuildContext context) => const Center(
        child: Text('Settings view'),
      );
}
