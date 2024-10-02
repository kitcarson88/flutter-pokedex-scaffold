import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/common/ws_no_list_data_found.dart';

class PokedexScaffoldWsNoListDataFound extends WsNoListDataFound {
  PokedexScaffoldWsNoListDataFound({
    super.key,
    super.padding,
    required String message,
  }) : super(
          messageBuilder: (context) => Text(
            message,
            textAlign: TextAlign.left,
            style: AppTheme.s16w400h20l120507dWhite(context),
          ),
        );
}
