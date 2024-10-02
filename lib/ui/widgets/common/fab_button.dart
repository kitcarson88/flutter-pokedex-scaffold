import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/core/base/base_button.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';

class FabButton extends BaseButton {
  static const _kSize = 56.0;
  static const _kShadowColor = Color(0x80000000);
  static const _kShadowBlurRadius = 12.0;
  static const _kShadowBlurOffset = Offset(0.0, 5.0);

  FabButton({
    super.key,
    required super.child,
    required void Function() super.onPressed,
    double? size = _kSize,
    super.margin,
    super.padding,
    super.color,
    Color? darkColor,
    super.gradient,
    Gradient? darkGradient,
    super.boxShadow = const [
      BoxShadow(color: _kShadowColor, blurRadius: _kShadowBlurRadius, offset: _kShadowBlurOffset),
    ],
  }) : super(
          width: size ?? _kSize,
          height: size ?? _kSize,
          borderRadius: BorderRadius.circular((size ?? _kSize) / 2),
        );

  @override
  FabButtonState createState() => FabButtonState();
}

class FabButtonState extends BaseButtonState {
  @override
  Widget body(BuildContext context) {
    Gradient? appliedGradient;
    Color? appliedColor;
    if (context.isDarkMode() && widget.darkGradient != null) {
      appliedGradient = widget.darkGradient;
    } else {
      appliedGradient = widget.gradient;
    }

    if (context.isDarkMode() && widget.darkColor != null) {
      appliedColor = widget.darkColor;
    } else {
      appliedColor = widget.color;
    }

    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding,
      margin: widget.margin,
      decoration: BoxDecoration(
        color: appliedGradient == null ? appliedColor : null,
        gradient: appliedColor == null ? appliedGradient : null,
        boxShadow: widget.boxShadow,
        borderRadius: widget.borderRadius,
      ),
      child: Center(child: widget.child),
    );
  }
}
