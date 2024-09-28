import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/ui/styles/assets.gen.dart';
import 'package:pokedex_scaffold/ui/styles/colors.gen.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_appbar.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PokedexScaffoldAppBar(
          backgroundColor: Colors.transparent,
          titleWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.icons.pokeball.svg(width: 20.w),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 5.w),
                child: Stack(
                  children: [
                    Text(
                      'Pokedex',
                      style: AppTheme.s26w700h20cPrimary(context).copyWith(
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 4
                          ..color = AppColors.tertiary,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      'Pokedex',
                      style: AppTheme.s26w700h20cPrimary(context),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: const Center(
          child: Text('Home view'),
        ),
      );
}
