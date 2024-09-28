import 'package:flutter/cupertino.dart';

class FlexibleText extends Text {
  final FlexFit fit;
  final int flex;
  final EdgeInsetsGeometry? padding;

  const FlexibleText(
    super.data, {
    super.key,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaleFactor,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    this.flex = 1,
    this.fit = FlexFit.loose,
    this.padding,
  });

  const FlexibleText.rich(
    super.textSpan, {
    super.key,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaleFactor,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    this.flex = 1,
    this.fit = FlexFit.loose,
    this.padding,
  }) : super.rich();

  @override
  Widget build(BuildContext context) => Flexible(
        flex: flex,
        fit: fit,
        child: padding != null
            ? Padding(padding: padding!, child: super.build(context))
            : super.build(context),
      );
}
