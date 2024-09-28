import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/ui/widgets/common/universal_tap_handler.dart';

abstract class BaseButton extends StatefulWidget {
  final Widget child;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final bool? fitWidth;
  final bool? fitHeight;
  final bool? useFitContainer;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? color, darkColor;
  final Gradient? gradient, darkGradient;
  final Color? disabledColor, disabledDarkColor;
  final Gradient? disabledGradient, disabledDarkGradient;
  final double? disabledOpacity;
  final List<BoxShadow>? boxShadow;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final BoxBorder? darkBorder;

  const BaseButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.width,
    this.height,
    this.fitWidth,
    this.fitHeight,
    this.useFitContainer,
    this.margin,
    this.padding,
    Color? color,
    this.darkColor,
    this.gradient,
    this.darkGradient,
    this.disabledColor,
    this.disabledDarkColor,
    this.disabledGradient,
    this.disabledDarkGradient,
    this.disabledOpacity,
    this.boxShadow,
    this.borderRadius,
    this.border,
    this.darkBorder,
  }) : color = color == null && gradient == null ? Colors.white : color;
}

abstract class BaseButtonState<ButtonImplementation extends BaseButton>
    extends State<ButtonImplementation> {
  @override
  Widget build(BuildContext context) => widget.onPressed != null
      ? UniversalTapHandler(
          onTap: widget.onPressed,
          child: body(context),
        )
      : body(context);

  Widget body(BuildContext context);
}
