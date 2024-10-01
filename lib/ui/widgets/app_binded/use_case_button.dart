import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_rounded_button.dart';

class UseCaseButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const UseCaseButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppTheme.defaultTopPadding,
        child: PokedexScaffoldRoundedButton(
          width: double.infinity,
          onPressed: onPressed,
          child: Text(
            label,
            style: AppTheme.s16w600h20cWhite(context),
          ),
        ),
      );
}
