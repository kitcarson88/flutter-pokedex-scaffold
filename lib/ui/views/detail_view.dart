import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/bloc/detail/detail_cubit.dart';
import 'package:pokedex_scaffold/configs/singleton_locator.dart';
import 'package:pokedex_scaffold/constants/untranslated_strings.dart' as strings;
import 'package:pokedex_scaffold/core/base/base_view.dart';
import 'package:pokedex_scaffold/core/models/dto/pokemon_dto.dart';
import 'package:pokedex_scaffold/core/models/form/pokemon_detail.dart';
import 'package:pokedex_scaffold/core/repositories/generic_repository.dart';
import 'package:pokedex_scaffold/core/repositories/pokemon_repository.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/app_binded/detail_background.dart';
import 'package:pokedex_scaffold/ui/widgets/app_binded/detail_fake_modal.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_circular_progress_indicator.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_fake_modal.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_ws_bloc_container.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_ws_error.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';
import 'package:pokedex_scaffold/utils/no_effects_scroll_behavior.dart';
import 'package:pokedex_scaffold/utils/ui_utils.dart';

@RoutePage()
class DetailView extends BaseStatelessView implements AutoRouteWrapper {
  static final _kNumberHeight = 120.h; // Same of font size
  static final _kPokeballTopPadding = 60.h;
  static final _kPokeballImageSize = 250.w;
  static final _kPokemonImageSize = 200.w;
  static final _kCardDisplacement = 60.h;

  final PokemonDTO data;

  DetailView({
    super.key,
    required this.data,
  }) : super(
          baseViewData: BaseViewData(
            isChildPage: true,
            backgroundColor: UiUtils.colorForPokemonType(data.mainType, false),
            appBarConfiguration: AppBarData(
              title: data.name,
            ),
          ),
        );

  @override
  Widget wrappedRoute(BuildContext context) {
    locator.registerSingleton(DetailCubit(
      pokemonRepository: locator<PokemonRepository>(),
      genericRepository: locator<GenericRepository>(),
    ));

    return this;
  }

  @override
  Widget body(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final topSystemStatusBarPadding = MediaQuery.of(context).viewPadding.top;
    // Top system bar height + app bar height + 1 pixel of header divider
    final topPadding = topSystemStatusBarPadding + AppTheme.appBarHeight + 1;

    return Stack(
      children: [
        DetailBackground(
          id: data.id!,
          screenHeight: screenHeight,
          topPadding: topPadding,
          pokemonImageSize: _kPokemonImageSize,
          numberHeight: _kNumberHeight,
          pokeballTopPadding: _kPokeballTopPadding,
          pokeballImageSize: _kPokeballImageSize,
        ),
        ScrollConfiguration(
          behavior: NoEffectsScrollBehavior(),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight / 2 - topPadding + _kCardDisplacement,
                ),
                PokedexScaffoldWsBlocContainer<DetailCubit, DetailState>(
                  loadingChild: _DetailDataLoadingContainer(
                    screenHeight: screenHeight,
                    cardDisplacement: _kCardDisplacement,
                  ),
                  errorChildBuilder: (context, error) => _DetailDataErrorContainer(
                    data.id!,
                    error,
                    screenHeight: screenHeight,
                    cardDisplacement: _kCardDisplacement,
                  ),
                  dataChildBuilder: (data, [_]) => _DetailDataFetchedContainer(
                    data.id!,
                    data,
                    screenHeight: screenHeight,
                    topPadding: topPadding,
                    cardDisplacement: _kCardDisplacement,
                    pokemonImageSize: _kPokemonImageSize,
                  ),
                  initialLoadCallback: () {
                    locator<DetailCubit>()
                        .retrievePokemonDetail(id: data.id!, language: context.locale.languageCode);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _DetailDataLoadingContainer extends StatelessWidget {
  final double screenHeight;
  final double cardDisplacement;

  const _DetailDataLoadingContainer({
    required this.screenHeight,
    required this.cardDisplacement,
  });

  @override
  Widget build(BuildContext context) => PokedexScaffoldFakeModal(
        minHeight: screenHeight / 2 - cardDisplacement,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PokedexScaffoldCircularProgressIndicator(),
          ],
        ),
      );
}

class _DetailDataErrorContainer extends StatelessWidget {
  static final _kInfosPadding = EdgeInsets.only(top: 30.h);

  final int id;
  final dynamic error;
  final double screenHeight;
  final double cardDisplacement;

  const _DetailDataErrorContainer(
    this.id,
    this.error, {
    required this.screenHeight,
    required this.cardDisplacement,
  });

  @override
  Widget build(BuildContext context) => PokedexScaffoldFakeModal(
        minHeight: screenHeight / 2 - cardDisplacement,
        child: Padding(
          padding: AppTheme.sidePadding.add(_kInfosPadding),
          child: PokedexScaffoldWsError(
            buttonPadding: EdgeInsets.only(top: 40.h),
            message: context.localization
                .serviceError(context.localization.pokemonDetail, strings.italianDel),
            retryCallback: () {
              locator<DetailCubit>()
                  .retrievePokemonDetail(id: id, language: context.locale.languageCode);
            },
          ),
        ),
      );
}

class _DetailDataFetchedContainer extends StatelessWidget {
  final int id;
  final PokemonDetail data;
  final double topPadding;
  final double screenHeight;
  final double cardDisplacement;
  final double pokemonImageSize;

  const _DetailDataFetchedContainer(
    this.id,
    this.data, {
    required this.screenHeight,
    required this.topPadding,
    required this.cardDisplacement,
    required this.pokemonImageSize,
  });

  @override
  Widget build(BuildContext context) => DetailFakeModal(
        data: data,
        screenHeight: screenHeight,
        cardDisplacement: cardDisplacement,
        pokemonImageSize: pokemonImageSize,
      );
}
