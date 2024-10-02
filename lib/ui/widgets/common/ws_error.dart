import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WsError extends StatelessWidget {
  static final _kPadding = EdgeInsets.only(top: 20.h);
  static final _kButtonPadding = EdgeInsets.only(top: 20.h);

  final Text Function(BuildContext context) messageBuilder;
  final Widget Function(BuildContext context) retryButtonBuilder;
  final EdgeInsetsGeometry? padding, buttonPadding;

  const WsError({
    super.key,
    required this.messageBuilder,
    required this.retryButtonBuilder,
    this.padding,
    this.buttonPadding,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding ?? _kPadding,
        child: Column(
          children: [
            messageBuilder(context),
            Padding(
              padding: buttonPadding ?? _kButtonPadding,
              child: retryButtonBuilder(context),
            ),
          ],
        ),
      );
}
