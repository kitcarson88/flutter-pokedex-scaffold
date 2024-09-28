import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/common/ws_error.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_rounded_button.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';

class PokedexScaffoldWsError extends WsError {
  PokedexScaffoldWsError({
    super.key,
    required String message,
    required void Function()? retryCallback,
    super.padding,
    super.buttonPadding,
  }) : super(
          messageBuilder: (context) => Text(
            message,
            style: AppTheme.s18w400h20l120507dWhite(context),
          ),
          retryButtonBuilder: (context) => PokedexScaffoldRoundedButton(
            onPressed: retryCallback,
            child: Text(
              context.localization.retry.toUpperCase(),
              style: AppTheme.s16w600h20cWhite(context),
            ),
          ),
        );
}
