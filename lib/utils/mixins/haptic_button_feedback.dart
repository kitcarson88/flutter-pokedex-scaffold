import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex_scaffold/core/base/base_button.dart';
import 'package:pokedex_scaffold/ui/widgets/common/universal_tap_handler.dart';

enum HapticFeedbackPower { light, medium, heavy, click, vibrate }

mixin HapticButtonFeedback on BaseButtonState {
  HapticFeedbackPower hapticFeedbackPower = HapticFeedbackPower.medium;

  void setHapticFeedbackPower(HapticFeedbackPower value) {
    hapticFeedbackPower = value;
  }

  @override
  Widget build(BuildContext context) => super.widget.onPressed != null
      ? UniversalTapHandler(
          onTap: () {
            if (!kIsWeb && Platform.isIOS) {
              switch (hapticFeedbackPower) {
                case HapticFeedbackPower.light:
                  HapticFeedback.lightImpact();
                  break;
                case HapticFeedbackPower.medium:
                  HapticFeedback.mediumImpact();
                  break;
                case HapticFeedbackPower.heavy:
                  HapticFeedback.heavyImpact();
                  break;
                case HapticFeedbackPower.click:
                  HapticFeedback.selectionClick();
                  break;
                case HapticFeedbackPower.vibrate:
                  HapticFeedback.vibrate();
                  break;
                default:
                  HapticFeedback.lightImpact();
                  break;
              }
            } else if (!kIsWeb && Platform.isAndroid) {
              HapticFeedback.mediumImpact();
            }
          },
          child: super.build(context),
        )
      : super.build(context);
}
