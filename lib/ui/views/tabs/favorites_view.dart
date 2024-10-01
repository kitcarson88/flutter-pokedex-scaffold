import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:pokedex_scaffold/app/router.dart';
import 'package:pokedex_scaffold/bloc/favorites/favorites_cubit.dart';
import 'package:pokedex_scaffold/configs/singleton_locator.dart';
import 'package:pokedex_scaffold/core/base/base_view.dart';
import 'package:pokedex_scaffold/core/models/dto/pokemon_dto.dart';
import 'package:pokedex_scaffold/ui/styles/assets.gen.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/app_binded/favorite_button.dart';
import 'package:pokedex_scaffold/ui/widgets/app_binded/pokemon_card.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';
import 'package:pokedex_scaffold/utils/extensions/string.dart';

@RoutePage()
class FavoritesView extends BaseStatelessView {
  FavoritesView({super.key})
      : super(
          baseViewData: BaseViewData(
            appBarConfiguration: AppBarData(
              titleBuilder: (context) => context.localization.favorites.capitalize(),
            ),
          ),
        );

  @override
  Widget body(BuildContext context) {
    final cubit = useBloc<FavoritesCubit>(closeOnDispose: false);
    final state = useBlocBuilder(cubit);

    return state.favorites.isEmpty
        ? const _NoFavoritesContainer()
        : _FavoritesListContainer(favorites: state.favorites);
  }
}

class _NoFavoritesContainer extends StatelessWidget {
  const _NoFavoritesContainer();

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: AppTheme.sidePadding,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                text: context.localization.noFavoritesFound,
                style: AppTheme.s16w400h20l120507dWhite(context),
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.bottom,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 10.w),
                  child: Assets.icons.pokeball.svg(
                    width: 20.h,
                  ),
                ),
              ),
            ]),
          ),
        ),
      );
}

class _FavoritesListContainer extends StatelessWidget {
  final List<PokemonDTO> favorites;

  const _FavoritesListContainer({
    required this.favorites,
  });

  @override
  Widget build(BuildContext context) => ListView.builder(
        padding: AppTheme.defaultTopPadding.add(AppTheme.bottomTabsPaddingWithSafeArea(context)),
        itemCount: favorites.length,
        itemBuilder: (context, index) => Padding(
          padding: AppTheme.sidePadding,
          child: PokemonCard(
            data: favorites[index],
            favoriteButton: FavoriteButton(
              active: true,
              onPressed: () {
                locator<FavoritesCubit>().removeFavoriteByIndex(index);
              },
            ),
            onPressed: () {
              AutoRouter.of(context).push(DetailRoute(
                data: favorites[index],
              ));
            },
          ),
        ),
      );
}
