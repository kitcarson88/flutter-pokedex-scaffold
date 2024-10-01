import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/core/base/base_view.dart';

class PlaceholderExampleView extends BaseStatelessView {
  final int numberOfPlaceholders;
  final double? placeholdersHeight;

  const PlaceholderExampleView({
    super.key,
    this.numberOfPlaceholders = 2,
    this.placeholdersHeight,
  }) : super(
          baseViewData: const BaseViewData(
            isModalPage: true,
          ),
        );

  @override
  Widget body(BuildContext context) => Column(
        children: [
          for (int i = 0; i < numberOfPlaceholders; ++i)
            Placeholder(
              fallbackHeight: placeholdersHeight ?? 300.h,
            ),
        ],
      );
}
