import 'package:flutter/material.dart';

class PokedexScaffoldShadowContainer extends StatelessWidget {
  static const _kShadowColor1 = Color(0x10000000);
  static const _kShadowColor2 = Color(0x1A1E1C79);

  // static const _kShadowColor1 = Color(0xFF000000);
  // static const _kShadowColor2 = Color(0xFF000000);

  final Widget child;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin;

  const PokedexScaffoldShadowContainer({
    super.key,
    required this.child,
    this.borderRadius,
    this.margin,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: margin,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: _kShadowColor1,
              blurRadius: 2,
              spreadRadius: 2,
              offset: Offset(0, 0),
            ),
            BoxShadow(
              color: _kShadowColor2,
              blurRadius: 10,
              spreadRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
          borderRadius: borderRadius,
        ),
        child: child,
      );
}
