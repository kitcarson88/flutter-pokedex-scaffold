import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_scaffold/core/base/base_modal.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';

@injectable
class ModalService {
  Future<T?> showModalView<T>(
    BuildContext context, {
    required BaseModal Function(BuildContext) modalBuilder,
    bool useRootNavigator = true,
    ShapeBorder? shape,
    bool enableDrag = true,
    bool isDismissible = true,
    bool isScrollControlled = true,
    bool useSafeArea = true,
    double? heightFactor,
    Offset? anchorPoint,
    Color? backgroundColor,
    Color? barrierColor,
  }) =>
      showModalBottomSheet<T>(
        context: context,
        builder: heightFactor != null
            ? (context) => FractionallySizedBox(
                  heightFactor: heightFactor,
                  child: modalBuilder(context),
                )
            : modalBuilder,
        useRootNavigator: useRootNavigator,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: AppTheme.defaultBorderRadius,
            ),
        enableDrag: enableDrag,
        isDismissible: isDismissible,
        isScrollControlled: isScrollControlled,
        useSafeArea: useSafeArea,
        anchorPoint: anchorPoint,
        backgroundColor: backgroundColor ?? AppTheme.lWhitedAndroidDark(context),
        barrierColor: barrierColor,
      );
}
