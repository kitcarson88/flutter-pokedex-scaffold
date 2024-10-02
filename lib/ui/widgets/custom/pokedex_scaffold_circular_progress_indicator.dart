import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pokedex_scaffold/ui/styles/colors.gen.dart';

class PokedexScaffoldCircularProgressIndicator extends PlatformCircularProgressIndicator {
  PokedexScaffoldCircularProgressIndicator({
    super.key,
    super.widgetKey,
    super.cupertino,
  }) : super(
          material: (context, target) => MaterialProgressIndicatorData(
            backgroundColor: Colors.transparent,
            color: AppColors.primary,
          ),
        );
}
