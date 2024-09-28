import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';

class PokedexScaffoldDivider extends StatelessWidget {
  final Color? color;
  final double thickness, height, indent, endIndent;

  const PokedexScaffoldDivider({
    super.key,
    this.color,
    this.thickness = 1,
    this.height = 0,
    this.indent = 0,
    this.endIndent = 0,
  });

  @override
  Widget build(BuildContext context) => Divider(
        color: color ?? AppTheme.secondary(context),
        thickness: thickness,
        height: height,
        indent: indent,
        endIndent: endIndent,
      );
}
