import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';

class PokedexScaffoldVerticalDivider extends StatelessWidget {
  final Color? color;
  final double thickness, width, indent, endIndent;

  const PokedexScaffoldVerticalDivider({
    super.key,
    this.color,
    this.thickness = 1,
    this.width = 0,
    this.indent = 0,
    this.endIndent = 0,
  });

  @override
  Widget build(BuildContext context) => VerticalDivider(
        color: color ?? AppTheme.primary(context),
        thickness: thickness,
        width: width,
        indent: indent,
        endIndent: endIndent,
      );
}
