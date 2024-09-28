import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';

class PokedexScaffoldAppBarButtonSizer extends StatelessWidget {
  final Widget? child;

  const PokedexScaffoldAppBarButtonSizer({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = AppTheme.appBarHeight;

    return SizedBox(
      width: size,
      height: size,
      child: child,
    );
  }
}
