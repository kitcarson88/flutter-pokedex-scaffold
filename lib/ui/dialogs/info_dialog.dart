import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/core/base/base_dialog.dart';
import 'package:pokedex_scaffold/ui/styles/assets.gen.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_rounded_button.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';
import 'package:pokedex_scaffold/utils/extensions/string.dart';
import 'package:pokedex_scaffold/utils/responsiveness_utils.dart';

class ExampleDialog extends BaseDialog {
  final String info;

  ExampleDialog({
    super.key,
    required super.title,
    required this.info,
  }) : super(
          icon: Assets.icons.info.path,
        );

  @override
  Widget body(BuildContext context) => Column(
        children: [
          Text(
            info,
            style: AppTheme.s16w400h20l120507dWhite(context),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: _buttonPadding(context),
            child: PokedexScaffoldRoundedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                context.localization.dismiss.capitalize(),
                style: AppTheme.s16w600h20cWhite(context),
              ),
            ),
          ),
        ],
      );

  EdgeInsets _buttonPadding(BuildContext context) => ResponsivenessUtils.getValueForRefinedHeight(
        context,
        smallHeight: const EdgeInsets.only(top: 20, bottom: 8.0),
        normalHeight: const EdgeInsets.only(top: 32, bottom: 16.0),
      );
}
