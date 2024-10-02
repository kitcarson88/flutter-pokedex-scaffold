import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';

class WsRefreshIndicator extends StatelessWidget {
  final Color? color, darkColor;
  final Color? backgroundColor, darkBackgroundColor;
  final Widget child;
  final Future<void> Function() onRefresh;

  const WsRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
    this.color,
    this.darkColor,
    this.backgroundColor,
    this.darkBackgroundColor,
  });

  @override
  Widget build(BuildContext context) => RefreshIndicator(
        color: context.isDarkMode() ? darkColor : color,
        backgroundColor: context.isDarkMode() ? darkBackgroundColor : backgroundColor,
        onRefresh: onRefresh,
        child: child,
      );
}
