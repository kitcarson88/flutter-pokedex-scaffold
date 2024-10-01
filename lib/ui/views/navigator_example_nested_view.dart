import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/core/base/base_view.dart';

class NavigatorExampleNestedView extends BaseStatelessView {
  const NavigatorExampleNestedView({super.key})
      : super(
          baseViewData: const BaseViewData(
            isChildPage: true,
            isModalPage: true,
            isModalNavigable: true,
          ),
        );

  @override
  Widget body(BuildContext context) => const Placeholder();
}
