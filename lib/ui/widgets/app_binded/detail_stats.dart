import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/core/models/form/stat.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_progress_bar.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';
import 'package:pokedex_scaffold/utils/extensions/string.dart';

class DetailStats extends StatelessWidget {
  final List<Stat> stats;

  const DetailStats({
    super.key,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.localization.stats.capitalize(),
            style: AppTheme.s18w700h20l120507dWhite(context),
          ),
          for (final stat in stats)
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      stat.name,
                      style: AppTheme.s18w400h20l120507dWhite(context),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Text(
                        stat.value.toString(),
                        style: AppTheme.s18w700h20l120507dWhite(context),
                      )),
                  Expanded(
                    flex: 7,
                    child: PokedexScaffoldProgressBar(
                      height: 18.h,
                      percentage: stat.value,
                    ),
                  ),
                ],
              ),
            ),
        ],
      );
}
