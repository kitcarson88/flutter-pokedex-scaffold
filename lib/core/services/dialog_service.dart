import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_scaffold/core/base/base_dialog.dart';

@injectable
class DialogService {
  Future<T?> showDialogWidget<T>(
    BuildContext context, {
    required BaseDialog Function(BuildContext context) dialogBuilder,
    bool useRootNavigator = true,
    Offset? anchorPoint,
    Color? barrierColor,
    bool barrierDismissible = true,
    bool useSafeArea = true,
  }) =>
      showDialog<T>(
        context: context,
        builder: dialogBuilder,
        barrierColor: barrierColor,
        anchorPoint: anchorPoint,
        barrierDismissible: barrierDismissible,
        useRootNavigator: useRootNavigator,
        useSafeArea: useSafeArea,
      );
}
