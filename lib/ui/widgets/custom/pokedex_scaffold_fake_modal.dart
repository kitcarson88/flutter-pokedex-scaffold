import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';

class PokedexScaffoldFakeModal extends StatelessWidget {
  final Widget child;
  final double minHeight;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;

  const PokedexScaffoldFakeModal({
    super.key,
    required this.child,
    required this.minHeight,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? AppTheme.lWhitedAndroidDark(context),
          borderRadius: borderRadius ??
              BorderRadius.only(
                topLeft: Radius.circular(AppTheme.defaultBorderRadiusValue),
                topRight: Radius.circular(AppTheme.defaultBorderRadiusValue),
              ),
        ),
        constraints: BoxConstraints(
          minHeight: minHeight,
        ),
        child: child,
      );
}
