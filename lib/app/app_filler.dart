import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/ui/styles/colors.gen.dart';

class AppFiller extends StatelessWidget {
  const AppFiller({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    brightness == Brightness.dark;

    return Container(
      color: brightness == Brightness.dark ? AppColors.splashDarkPrimary : AppColors.splashPrimary,
    );
  }
}
