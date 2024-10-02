import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/common/button.dart';
import 'package:pokedex_scaffold/utils/mixins/bouncing_button_animation.dart';
import 'package:pokedex_scaffold/utils/mixins/haptic_button_feedback.dart';

class PokedexScaffoldLinkButton extends Button {
  static final _kDefaultBorderRadius = 8.w;

  PokedexScaffoldLinkButton({
    super.key,
    required super.child,
    required super.onPressed,
    double? width,
    double? height,
    bool? fitWidth,
    bool? fitHeight,
    bool? useFitContainer,
    double? borderRadius,
    super.padding,
  }) : super(
          boxShadow: null,
          color: Colors.transparent,
          width: width ?? AppTheme.defaultButtonWidth,
          height: height ?? AppTheme.defaultButtonHeight,
          fitWidth: fitWidth ?? false,
          fitHeight: fitHeight ?? false,
          useFitContainer: useFitContainer ?? true,
          borderRadius: borderRadius ?? _kDefaultBorderRadius,
        );

  @override
  ButtonState createState() => _PokedexScaffoldLinkButtonState();
}

class _PokedexScaffoldLinkButtonState extends ButtonState
    with TickerProviderStateMixin, HapticButtonFeedback, BouncingButtonAnimation {
  static const _kAnimationMilliseconds = 50;

  @override
  void initState() {
    super.setAnimationMilliseconds(_kAnimationMilliseconds);
    super.initState();
  }
}
