import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';

@injectable
class ToastService {
  void showToast(
    BuildContext context, {
    required Widget body,
    int milliseconds = 4000,
    bool showAsSnackbar = false,
    Color? backgroundColor,
    TextStyle? textStyle,
    double boxShadowElevation = 0,
    EdgeInsetsGeometry? margin,
  }) {
    final bckColor = backgroundColor ?? AppTheme.secondary(context);

    EdgeInsetsGeometry? m;

    if (showAsSnackbar) {
      m = null;
    } else {
      m = margin ?? EdgeInsets.only(bottom: 25.h, right: 10.w, left: 10.w);
    }

    final snackbar = SnackBar(
      content: body,
      duration: Duration(milliseconds: milliseconds),
      behavior: showAsSnackbar ? SnackBarBehavior.fixed : SnackBarBehavior.floating,
      backgroundColor: bckColor,
      elevation: boxShadowElevation,
      margin: m,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void showInfoToast(
    BuildContext context, {
    required String text,
    int milliseconds = 4000,
    bool showAsSnackbar = false,
    Color? backgroundColor,
    TextStyle? textStyle,
    double boxShadowElevation = 0,
    EdgeInsetsGeometry? margin,
  }) {
    final bckColor = backgroundColor ?? AppTheme.secondary(context);
    final txtStyle = textStyle ?? AppTheme.s16w400h20cWhite(context);

    EdgeInsetsGeometry? m;

    if (showAsSnackbar) {
      m = null;
    } else {
      m = margin ?? EdgeInsets.only(bottom: 25.h, right: 10.w, left: 10.w);
    }

    final snackbar = SnackBar(
      content: Text(
        text,
        style: txtStyle,
      ),
      duration: Duration(milliseconds: milliseconds),
      behavior: showAsSnackbar ? SnackBarBehavior.fixed : SnackBarBehavior.floating,
      backgroundColor: bckColor,
      elevation: boxShadowElevation,
      margin: m,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
