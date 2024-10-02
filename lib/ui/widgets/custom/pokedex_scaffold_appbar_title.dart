import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';

class PokedexScaffoldAppBarTitle extends StatelessWidget {
  final Widget titleWidget;
  final bool centerTitle;
  final bool useLeftPadding;

  const PokedexScaffoldAppBarTitle({
    super.key,
    required this.titleWidget,
    required this.centerTitle,
    this.useLeftPadding = true,
  });
  @override
  Widget build(BuildContext context) => Expanded(
        child: Row(
          mainAxisAlignment: centerTitle ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width -
                      (2 * AppTheme.appBarHeight + AppTheme.sidePadding.left)),
              child: titleWidget,
            ),
          ],
        ),
      );
}
