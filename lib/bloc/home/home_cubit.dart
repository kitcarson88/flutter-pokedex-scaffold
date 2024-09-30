import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_scaffold/core/base/base_bloc.dart';
import 'package:pokedex_scaffold/core/models/dto/pokemon_dto.dart';
import 'package:pokedex_scaffold/core/repositories/pokemon_repository.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

@lazySingleton
class HomeCubit extends BaseWsCubit<HomeState> {
  static const _kItemsPerPage = 20;

  final PokemonRepository pokemonRepository;
  int _page = 0;

  HomeCubit({
    required this.pokemonRepository,
  }) : super(const HomeState.valuesSet());

  void loadPokemons({String? language, bool reload = true}) async {
    if (!state.loading) {
      emit(HomeState.loading(state, resetData: reload));

      _page = reload ? 0 : _page + 1;

      try {
        final List<PokemonDTO> list = (await pokemonRepository.getPokemons(
          language: language,
          offset: _page * _kItemsPerPage,
          limit: _kItemsPerPage,
        ))
            .where((dto) =>
                dto.id != null &&
                dto.name != null &&
                dto.name!.isNotEmpty &&
                dto.thumbnail != null &&
                dto.thumbnail!.isNotEmpty &&
                dto.mainType != null)
            .sorted((a, b) => a.id! - b.id!)
            .toList();

        emit(HomeState.dataFetched(state, data: list));
      } catch (e) {
        _page--;
        logger.severe('Error occurred while loading pokemons: $e');
        emit(HomeState.errorOccurred(state, error: e));
      }
    }
  }
}
