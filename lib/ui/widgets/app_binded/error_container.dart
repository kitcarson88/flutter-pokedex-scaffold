import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/ui/styles/assets.gen.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_ws_error.dart';

class ErrorContainer extends StatelessWidget {
  final String message;
  final void Function() retryCallback;
  final double? height;

  const ErrorContainer({
    super.key,
    required this.message,
    required this.retryCallback,
    this.height,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60.h, bottom: 20.h),
            child: Assets.images.pikachu.image(
              height: height,
            ),
          ),
          Padding(
            padding: AppTheme.sidePadding,
            child: PokedexScaffoldWsError(
              message: message,
              retryCallback: retryCallback,
            ),
          ),
        ],
      );
}
