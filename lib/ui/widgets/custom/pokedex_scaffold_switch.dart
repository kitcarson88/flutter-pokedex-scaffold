import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex_scaffold/ui/styles/assets.gen.dart';
import 'package:pokedex_scaffold/ui/styles/colors.gen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PokedexScaffoldSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const PokedexScaffoldSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData.light(useMaterial3: false),
        child: Skeleton.ignore(
          child: Switch(
            value: value,
            onChanged: onChanged != null
                ? (bool value) {
                    HapticFeedback.mediumImpact();
                    onChanged!(value);
                  }
                : null,
            activeThumbImage: Assets.images.v.provider(),
            activeColor: AppColors.secondary,
            activeTrackColor: AppColors.cB0C0CE,
            inactiveThumbImage: Assets.images.x.provider(),
            inactiveThumbColor: AppColors.c748494,
            inactiveTrackColor: AppColors.cB0C0CE,
            overlayColor: WidgetStateProperty.resolveWith((states) => Colors.transparent),
          ),
        ),
      );
}
