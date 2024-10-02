import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';

class WsNoListDataFound extends StatelessWidget {
  final Text Function(BuildContext context) messageBuilder;
  final EdgeInsetsGeometry? padding;

  const WsNoListDataFound({
    super.key,
    required this.messageBuilder,
    this.padding,
  });

  @override
  Widget build(BuildContext context) => ListView(
        padding: padding ?? AppTheme.defaultTopPadding,
        children: [
          messageBuilder(context),
        ],
      );
}
