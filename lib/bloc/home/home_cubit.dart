import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_scaffold/core/base/base_bloc.dart';
import 'package:pokedex_scaffold/core/models/dto/pokemon_dto.dart';
import 'package:pokedex_scaffold/core/repositories/pokemon_repository.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

@lazySingleton
class HomeCubit extends BaseWsCubit<HomeState> {
  final PokemonRepository pokemonRepository;

  HomeCubit({
    required this.pokemonRepository,
  }) : super(const HomeState.valuesSet());

  void loadPokemons({String? language}) async {
    emit(HomeState.loading(state));

    try {
      final data = await pokemonRepository.getPokemons(language: language);
      final List<PokemonDTO> list = data
          .where((dto) =>
              dto.id != null &&
              dto.name != null &&
              dto.name!.isNotEmpty &&
              dto.description != null &&
              dto.description!.isNotEmpty &&
              dto.thumbnail != null &&
              dto.thumbnail!.isNotEmpty &&
              dto.mainType != null)
          .toList();
      emit(HomeState.dataFetched(state, data: list));
    } catch (e) {
      logger.severe('Error occurred while loading pokemons: $e');
      emit(HomeState.errorOccurred(state, error: e));
    }
  }
}
