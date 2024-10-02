import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:pokedex_scaffold/app/router.dart';
import 'package:pokedex_scaffold/bloc/favorites/favorites_cubit.dart';
import 'package:pokedex_scaffold/bloc/home/home_cubit.dart';
import 'package:pokedex_scaffold/configs/singleton_locator.dart';
import 'package:pokedex_scaffold/constants/untranslated_strings.dart' as strings;
import 'package:pokedex_scaffold/core/base/base_view.dart';
import 'package:pokedex_scaffold/core/models/dto/pokemon_dto.dart';
import 'package:pokedex_scaffold/core/models/enum/pokemon_type.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/app_binded/error_container.dart';
import 'package:pokedex_scaffold/ui/widgets/app_binded/favorite_button.dart';
import 'package:pokedex_scaffold/ui/widgets/app_binded/pokemon_card.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_circular_progress_indicator.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_ws_bloc_container.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';
import 'package:pokedex_scaffold/utils/extensions/string.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class HomeView extends BaseStatelessView {
  HomeView({super.key})
      : super(
          baseViewData: BaseViewData(
            appBarConfiguration: AppBarData(
              titleBuilder: (context) => context.localization.pokedex.capitalize(),
            ),
          ),
        );

  @override
  Widget body(BuildContext context) => PokedexScaffoldWsBlocContainer<HomeCubit, HomeState>(
        prioritiseDataWhenAvailable: true,
        loadingChild: _LoadingContainer(),
        // errorMessage:
        //     context.localization.serviceError(context.localization.pokemon, strings.italianDei),
        // errorRetryCallback: () {
        //   locator<HomeCubit>().loadPokemons(language: context.locale.languageCode);
        // },
        errorChildBuilder: (context, error) => ErrorContainer(
          message:
              context.localization.serviceError(context.localization.pokemon, strings.italianDei),
          retryCallback: () {
            locator<HomeCubit>().loadPokemons(language: context.locale.languageCode);
          },
        ),
        noListDataFoundMessage: context.localization.noDataFound(
            context.localization.pokemon, 'male', context.localization.no('other').capitalize()),
        dataRefreshCallback: () async {
          HapticFeedback.mediumImpact();
          locator<HomeCubit>().loadPokemons(language: context.locale.languageCode);
        },
        dataChildBuilder: (data, [loading]) => _DataFetchedContainer(
          data: data,
          loading: loading ?? false,
        ),
        initialLoadCallback: () {
          locator<HomeCubit>().loadPokemons(language: context.locale.languageCode);
        },
      );
}

class _LoadingContainer extends StatelessWidget {
  static final _kSkeletonData = [
    PokemonDTO(name: BoneMock.name, mainType: PokemonType.grass),
    PokemonDTO(name: BoneMock.name, mainType: PokemonType.grass),
    PokemonDTO(name: BoneMock.name, mainType: PokemonType.grass),
    PokemonDTO(name: BoneMock.name, mainType: PokemonType.fire),
    PokemonDTO(name: BoneMock.name, mainType: PokemonType.fire),
    PokemonDTO(name: BoneMock.name, mainType: PokemonType.fire),
    PokemonDTO(name: BoneMock.name, mainType: PokemonType.water),
    PokemonDTO(name: BoneMock.name, mainType: PokemonType.water),
    PokemonDTO(name: BoneMock.name, mainType: PokemonType.water),
    PokemonDTO(name: BoneMock.name, mainType: PokemonType.bug),
    PokemonDTO(name: BoneMock.name, mainType: PokemonType.bug),
    PokemonDTO(name: BoneMock.name, mainType: PokemonType.bug),
    PokemonDTO(name: BoneMock.name, mainType: PokemonType.bug),
    PokemonDTO(name: BoneMock.name, mainType: PokemonType.bug),
    PokemonDTO(name: BoneMock.name, mainType: PokemonType.bug),
    PokemonDTO(name: BoneMock.name, mainType: PokemonType.normal),
    PokemonDTO(name: BoneMock.name, mainType: PokemonType.normal),
    PokemonDTO(name: BoneMock.name, mainType: PokemonType.normal),
    PokemonDTO(name: BoneMock.name, mainType: PokemonType.normal),
    PokemonDTO(name: BoneMock.name, mainType: PokemonType.normal),
  ];

  @override
  Widget build(BuildContext context) => Skeletonizer(
        ignorePointers: false,
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: AppTheme.bottomSafeAreaHeight(context)),
          itemCount: _kSkeletonData.length,
          itemBuilder: (context, index) => Padding(
            padding: AppTheme.sidePadding,
            child: PokemonCard(
                data: _kSkeletonData.map((item) => item.copyWith(id: index + 1)).toList()[index]),
          ),
        ),
      );
}

class _DataFetchedContainer extends HookWidget {
  static final _kInfiniteScrollLoaderSize = 40.h;
  static final _kInfiniteScrollLoaderVerticalPadding = 20.h;

  final List<PokemonDTO> data;
  final bool loading;

  const _DataFetchedContainer({
    required this.data,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        locator<HomeCubit>().loadPokemons(language: context.locale.languageCode, reload: false);
      }
    });

    return ListView.builder(
      controller: scrollController,
      padding: EdgeInsets.only(
          bottom: AppTheme.bottomSafeAreaHeight(context) +
              AppTheme.mainTabsWaveViewBottomPadding +
              (loading
                  ? 0
                  : _kInfiniteScrollLoaderSize + _kInfiniteScrollLoaderVerticalPadding * 2)),
      itemCount: data.length + (loading ? 1 : 0),
      itemBuilder: (context, index) => index == data.length
          ? Container(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              alignment: Alignment.center,
              child: SizedBox(
                width: _kInfiniteScrollLoaderSize,
                height: _kInfiniteScrollLoaderSize,
                child: PokedexScaffoldCircularProgressIndicator(),
              ),
            )
          : Padding(
              padding: AppTheme.sidePadding,
              child: PokemonCard(
                data: data[index],
                favoriteButton: _FavoriteButton(data[index]),
                onPressed: () {
                  AutoRouter.of(context).push(DetailRoute(
                    data: data[index],
                  ));
                },
              ),
            ),
    );
  }
}

class _FavoriteButton extends HookWidget {
  final PokemonDTO data;

  const _FavoriteButton(this.data);

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<FavoritesCubit>(closeOnDispose: false);
    final state = useBlocBuilder(cubit);

    return FavoriteButton(
      active: state.favorites.contains(data),
      onPressed: () {
        locator<FavoritesCubit>().updateFavorites(data);
      },
    );
  }
}
