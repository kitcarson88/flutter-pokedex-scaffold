import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/core/base/base_view.dart';

@RoutePage()
class DetailView extends BaseStatelessView {
  const DetailView({super.key})
      : super(
          baseViewData: const BaseViewData(
            isChildPage: true,
            appBarConfiguration: AppBarData(
              title: 'Pokemon Detail',
            ),
          ),
        );

  @override
  Widget body(BuildContext context) => const Center(
        child: Text('Pokemon detail view'),
      );
}
