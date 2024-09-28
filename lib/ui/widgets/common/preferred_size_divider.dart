import 'package:flutter/material.dart';

class PreferredSizeDivider extends StatelessWidget implements PreferredSizeWidget {
  final double? height;
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final Color? color;

  const PreferredSizeDivider({
    super.key,
    this.height,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
  });

  @override
  Widget build(BuildContext context) => Divider(
        height: height,
        thickness: thickness,
        indent: indent,
        endIndent: endIndent,
        color: color,
      );

  @override
  Size get preferredSize => const Size.fromHeight(1);
}
