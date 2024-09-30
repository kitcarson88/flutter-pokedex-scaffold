import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex_scaffold/app/router.dart';
import 'package:pokedex_scaffold/bloc/home/home_cubit.dart';
import 'package:pokedex_scaffold/configs/singleton_locator.dart';
import 'package:pokedex_scaffold/constants/untranslated_strings.dart' as strings;
import 'package:pokedex_scaffold/core/base/base_view.dart';
import 'package:pokedex_scaffold/core/models/dto/pokemon_dto.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/app_binded/pokemon_card.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_ws_bloc_container.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';
import 'package:pokedex_scaffold/utils/extensions/string.dart';

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
        errorMessage:
            context.localization.serviceError(context.localization.pokemon, strings.italianDei),
        errorRetryCallback: () {
          locator<HomeCubit>().loadPokemons(language: context.locale.languageCode);
        },
        noListDataFoundMessage: context.localization.noDataFound(
            context.localization.pokemon, 'male', context.localization.no('other').capitalize()),
        dataRefreshCallback: () async {
          HapticFeedback.mediumImpact();
          locator<HomeCubit>().loadPokemons(language: context.locale.languageCode);
        },
        dataChildBuilder: (data, [_]) => _DataFetchedContainer(data: data),
        initialLoadCallback: () {
          locator<HomeCubit>().loadPokemons(language: context.locale.languageCode);
        },
      );
}

class _DataFetchedContainer extends StatelessWidget {
  final List<PokemonDTO> data;

  const _DataFetchedContainer({
    required this.data,
  });

  @override
  Widget build(BuildContext context) => ListView.builder(
        padding: EdgeInsets.only(
            bottom:
                AppTheme.bottomSafeAreaHeight(context) + AppTheme.mainTabsWaveViewBottomPadding),
        itemCount: data.length,
        itemBuilder: (context, index) => Padding(
          padding: AppTheme.sidePadding,
          child: PokemonCard(
            data: data[index],
            onPressed: () {
              AutoRouter.of(context).push(const DetailRoute());
            },
          ),
        ),
      );
}
