import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';

enum HapticFeedbackPower { light, medium, heavy, click, vibrate }

class HapticCupertinoButton extends CupertinoButton {
  HapticCupertinoButton({
    super.key,
    required super.child,
    required VoidCallback? onPressed,
    super.padding,
    super.minSize = null,
    super.color,
    final Color? disabledColor,
    super.borderRadius = null,
    HapticFeedbackPower? hapticFeedbackPower = HapticFeedbackPower.medium,
  }) : super(
          disabledColor: disabledColor ?? CupertinoColors.quaternarySystemFill,
          onPressed: onPressed != null
              ? () {
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

                  onPressed();
                }
              : null,
        );

  HapticCupertinoButton.filled({
    super.key,
    required super.child,
    required VoidCallback? onPressed,
    super.padding,
    super.minSize = null,
    super.borderRadius = null,
    HapticFeedbackPower? hapticFeedbackPower = HapticFeedbackPower.click,
  }) : super.filled(
          onPressed: onPressed != null
              ? () {
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

                  onPressed();
                }
              : null,
        );
}
