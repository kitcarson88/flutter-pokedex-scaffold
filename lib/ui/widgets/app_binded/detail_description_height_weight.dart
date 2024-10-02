import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/constants/untranslated_strings.dart' as strings;
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_vertical_divider.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';
import 'package:pokedex_scaffold/utils/extensions/string.dart';

class DetailDescriptionHeightWeight extends StatelessWidget {
  final String description;
  final int height, weight;

  const DetailDescriptionHeightWeight({
    super.key,
    required this.description,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 60.h,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  description.wordsOnNewLine(),
                  style: AppTheme.s18w700h20l120507dWhite(context),
                  textAlign: TextAlign.center,
                ),
              ),
              const PokedexScaffoldVerticalDivider(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.localization.height.capitalize(),
                      style: AppTheme.s18w700h20l120507dWhite(context),
                    ),
                    Text(
                      '$height´',
                      style: AppTheme.s18w400h20l120507dWhite(context),
                    ),
                  ],
                ),
              ),
              const PokedexScaffoldVerticalDivider(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.localization.weight.capitalize(),
                      style: AppTheme.s18w700h20l120507dWhite(context),
                    ),
                    Text(
                      '$weight ${strings.pound}',
                      style: AppTheme.s18w400h20l120507dWhite(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
