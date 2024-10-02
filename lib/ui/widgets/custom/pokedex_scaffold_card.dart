import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_shadow_container.dart';

class PokedexScaffoldCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final Color? color;

  const PokedexScaffoldCard({
    super.key,
    required this.child,
    this.margin,
    this.color,
  });

  @override
  Widget build(BuildContext context) => PokedexScaffoldShadowContainer(
        margin: margin,
        borderRadius: AppTheme.defaultBorderRadius,
        child: Card(
          clipBehavior: Clip.hardEdge,
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: AppTheme.defaultBorderRadius,
          ),
          child: child,
        ),
      );
}
