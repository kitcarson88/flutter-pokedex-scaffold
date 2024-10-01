import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/core/models/dto/pokemon_dto.dart';
import 'package:pokedex_scaffold/ui/styles/assets.gen.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/app_binded/pokemon_type_icon.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_card.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_circular_progress_indicator.dart';
import 'package:pokedex_scaffold/utils/ui_utils.dart';

class PokemonCard extends StatelessWidget {
  final PokemonDTO data;
  final void Function()? onPressed;
  final Widget? favoriteButton;

  const PokemonCard({
    super.key,
    required this.data,
    this.favoriteButton,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: PokedexScaffoldCard(
          margin: EdgeInsets.only(top: 20.h),
          color: UiUtils.colorForPokemonType(data.mainType),
          child: Stack(
            children: [
              PositionedDirectional(
                bottom: -20.w,
                end: -20.h,
                child: SizedBox(
                  width: 100.w,
                  child: Assets.images.pokeball.image(),
                ),
              ),
              if (data.thumbnail != null)
                PositionedDirectional(
                  bottom: 5.h,
                  end: 5.w,
                  child: SizedBox(
                    width: 100.w,
                    child: CachedNetworkImage(
                      imageUrl: data.thumbnail!,
                      placeholder: (context, url) => Center(
                        child: SizedBox(
                          width: 20.w,
                          height: 20.w,
                          child: PokedexScaffoldCircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(),
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          UiUtils.integerStringWithFixedCharacters(data.id!, 3),
                          style: AppTheme.s40w600h40cWhite70,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 10.w),
                          child: favoriteButton ??
                              SizedBox(
                                width: 46.w,
                                height: 46.w,
                              ),
                        ),
                      ],
                    ),
                    Text(
                      data.name!,
                      style: AppTheme.s20w700h20cBlack45,
                    ),
                    if (data.mainType != null || data.otherTypes?.isNotEmpty != null)
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Row(
                          children: [
                            if (data.mainType != null)
                              PokemonTypeIcon(
                                data.mainType!,
                                size: 20.h,
                              ),
                            if (data.otherTypes?.isNotEmpty != null)
                              for (final type in data.otherTypes!)
                                Padding(
                                  padding: EdgeInsetsDirectional.only(start: 5.w),
                                  child: PokemonTypeIcon(
                                    type,
                                    size: 20.h,
                                  ),
                                ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
