import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/core/models/form/pokemon_detail.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/app_binded/detail_description_height_weight.dart';
import 'package:pokedex_scaffold/ui/widgets/app_binded/detail_stats.dart';
import 'package:pokedex_scaffold/ui/widgets/app_binded/pokemon_type_chip.dart';
import 'package:pokedex_scaffold/ui/widgets/common/unordered_list.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_divider.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';
import 'package:pokedex_scaffold/utils/extensions/string.dart';

class DetailInfos extends StatelessWidget {
  final PokemonDetail detail;

  const DetailInfos(this.detail, {super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(bottom: 40.h),
        child: Column(
          children: [
            if (detail.types != null && detail.types!.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (final (index, typeData) in detail.types!.indexed)
                    Padding(
                      padding: detail.types!.length > 1 && index == detail.types!.length - 1
                          ? EdgeInsetsDirectional.only(start: 10.w)
                          : EdgeInsets.zero,
                      child: PokemonTypeChip(data: typeData),
                    ),
                ],
              ),
            if (detail.description != null &&
                detail.description!.isNotEmpty &&
                detail.height != null &&
                detail.weight != null)
              Padding(
                padding: AppTheme.defaultTopPadding,
                child: DetailDescriptionHeightWeight(
                  description: detail.description!,
                  height: detail.height!,
                  weight: detail.weight!,
                ),
              ),
            if (detail.stats != null && detail.stats!.isNotEmpty)
              Padding(
                padding: AppTheme.sidePadding.add(AppTheme.defaultTopPadding),
                child: DetailStats(stats: detail.stats!),
              ),
            if (detail.behaviors != null) ...[
              PokedexScaffoldDivider(
                height: AppTheme.defaultTopPadding.top * 2,
                indent: AppTheme.sidePadding.left,
                endIndent: AppTheme.sidePadding.right,
              ),
              Padding(
                padding: AppTheme.sidePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.localization.curiosities.capitalize(),
                      style: AppTheme.s18w700h20l120507dWhite(context),
                    ),
                    UnorderedList(
                      detail.behaviors!,
                      textsStyle: AppTheme.s18w400h20l120507dWhite(context),
                      textsPadding: EdgeInsets.only(top: 10.h),
                    ),
                  ],
                ),
              )
            ],
          ],
        ),
      );
}
