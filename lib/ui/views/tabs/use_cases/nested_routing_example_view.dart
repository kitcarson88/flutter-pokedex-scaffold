import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/core/base/base_view.dart';

@RoutePage()
class NestedRoutingExampleView extends BaseStatelessView {
  const NestedRoutingExampleView({super.key})
      : super(
          baseViewData: const BaseViewData(
            isChildPage: true,
          ),
        );

  @override
  Widget body(BuildContext context) => const Placeholder();
}
