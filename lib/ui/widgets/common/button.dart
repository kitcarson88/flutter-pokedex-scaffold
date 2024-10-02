import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/core/base/base_button.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';

class Button extends BaseButton {
  static const _kWidth = 100.0;
  static const _kHeight = 50.0;
  static const _kBorderRadius = 4.0;
  static const _kBoxShadow =
      BoxShadow(color: Color(0x80000000), blurRadius: 12.0, offset: Offset(0.0, 5.0));

  Button({
    super.key,
    required super.child,
    required super.onPressed,
    super.width = _kWidth,
    super.height = _kHeight,
    bool fitWidth = false,
    bool fitHeight = false,
    bool useFitContainer = true,
    double borderRadius = _kBorderRadius,
    super.margin,
    super.padding,
    super.color,
    super.darkColor,
    super.gradient,
    super.darkGradient,
    super.disabledColor,
    super.disabledDarkColor,
    super.disabledGradient,
    super.disabledDarkGradient,
    super.disabledOpacity,
    super.boxShadow = const [_kBoxShadow],
    super.border,
    super.darkBorder,
  }) : super(
          fitWidth: fitWidth,
          fitHeight: fitHeight,
          useFitContainer: useFitContainer,
          borderRadius: BorderRadius.circular(borderRadius),
        );

  @override
  ButtonState createState() => ButtonState();
}

class ButtonState extends BaseButtonState {
  @override
  Widget body(BuildContext context) {
    Gradient? appliedGradient;
    Color? appliedColor;
    BoxBorder? appliedBorder;

    if (widget.onPressed == null) {
      if (context.isDarkMode() && widget.darkGradient != null) {
        appliedGradient = widget.disabledDarkGradient;
      } else {
        appliedGradient = widget.disabledGradient;
      }

      if (context.isDarkMode() && widget.darkColor != null) {
        appliedColor = widget.disabledDarkColor;
      } else {
        appliedColor = widget.disabledColor;
      }
    } else {
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

      if (context.isDarkMode() && widget.darkBorder != null) {
        appliedBorder = widget.darkBorder;
      } else {
        appliedBorder = widget.border;
      }
    }

    Widget body = Container(
      width: widget.fitWidth != null && !widget.fitWidth! ? widget.width : null,
      height: widget.fitHeight != null && !widget.fitHeight! ? widget.height : null,
      padding: widget.padding,
      margin: widget.margin,
      decoration: BoxDecoration(
        color: appliedGradient == null ? appliedColor : null,
        gradient: appliedColor == null ? appliedGradient : null,
        boxShadow: widget.boxShadow,
        borderRadius: widget.borderRadius,
        border: appliedBorder,
      ),
      child: Center(child: widget.child),
    );

    if ((widget.fitWidth != null && widget.fitWidth! ||
            widget.fitHeight != null && widget.fitHeight!) &&
        widget.useFitContainer != null &&
        widget.useFitContainer!) {
      body = FittedBox(child: body);
    }

    return widget.onPressed == null && widget.disabledOpacity != null
        ? Opacity(
            opacity: widget.disabledOpacity!,
            child: body,
          )
        : body;
  }
}
