import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/ui/styles/colors.gen.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/common/button.dart';
import 'package:pokedex_scaffold/utils/mixins/bouncing_button_animation.dart';
import 'package:pokedex_scaffold/utils/mixins/haptic_button_feedback.dart';

class PokedexScaffoldRoundedButton extends Button {
  PokedexScaffoldRoundedButton({
    super.key,
    required super.child,
    required super.onPressed,
    double? width,
    double? height,
    bool? fitWidth,
    bool? fitHeight,
    bool? useFitContainer,
    super.padding,
  }) : super(
          boxShadow: null,
          color: AppColors.primary,
          darkColor: AppColors.darkPrimary,
          width: width ?? AppTheme.defaultButtonWidth,
          height: height ?? AppTheme.defaultButtonHeight,
          fitWidth: fitWidth ?? false,
          fitHeight: fitHeight ?? false,
          useFitContainer: useFitContainer ?? true,
          borderRadius: (height ?? AppTheme.defaultButtonHeight) / 2,
        );

  @override
  ButtonState createState() => _PokedexScaffoldRoundedButtonState();
}

class _PokedexScaffoldRoundedButtonState extends ButtonState
    with TickerProviderStateMixin, HapticButtonFeedback, BouncingButtonAnimation {
  static const _kAnimationMilliseconds = 50;

  @override
  void initState() {
    super.setAnimationMilliseconds(_kAnimationMilliseconds);
    super.initState();
  }
}
