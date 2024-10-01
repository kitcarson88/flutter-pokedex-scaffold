import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/core/base/base_view.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/views/navigator_example_nested_view.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_rounded_button.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';

class PlaceholderExampleWithNavigationView extends BaseStatelessView {
  final int numberOfPlaceholders;
  final double? placeholdersHeight;

  const PlaceholderExampleWithNavigationView({
    super.key,
    this.numberOfPlaceholders = 2,
    this.placeholdersHeight,
  }) : super(
          baseViewData: const BaseViewData(
            isModalPage: true,
            isModalNavigable: true,
          ),
        );

  @override
  Widget body(BuildContext context) => Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                for (int i = 0; i < numberOfPlaceholders; ++i)
                  Placeholder(
                    fallbackHeight: placeholdersHeight ?? 300.h,
                  ),
              ],
            ),
          ),
          Padding(
            padding: AppTheme.sidePadding.add(AppTheme.defaultTopPadding.copyWith(bottom: 20.h)),
            child: PokedexScaffoldRoundedButton(
              width: double.infinity,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NavigatorExampleNestedView(),
                ));
              },
              child: Text(
                context.localization.modalNestedNavigation,
                style: AppTheme.s16w600h20cWhite(context),
              ),
            ),
          ),
        ],
      );
}
