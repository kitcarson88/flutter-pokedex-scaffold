import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';

class PokedexScaffoldProgressBar extends StatelessWidget {
  static const kChangeColorPercentage = 50;

  static final kDefaultHeight = 24.h;

  final int percentage;
  final bool useTitle;
  final double? height;

  const PokedexScaffoldProgressBar({
    super.key,
    required this.percentage,
    this.useTitle = true,
    this.height,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 3.h),
        child: Container(
          alignment: AlignmentDirectional.centerStart,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppTheme.lPrimarydF5F6F7(context),
            ),
            borderRadius: BorderRadius.circular((height ?? kDefaultHeight) / 2),
          ),
          width: double.infinity,
          height: height ?? kDefaultHeight,
          padding: const EdgeInsets.all(1),
          child: FractionallySizedBox(
            widthFactor: min(percentage, 100) / 100,
            child: Container(
              decoration: BoxDecoration(
                color: percentage < kChangeColorPercentage
                    ? AppTheme.secondary(context)
                    : AppTheme.l53E053d3EB33E(context),
                borderRadius: BorderRadius.circular(((height ?? kDefaultHeight) - 4) / 2),
              ),
            ),
          ),
        ),
      );
}
