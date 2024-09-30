import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_scaffold/configs/singleton_locator.dart';
import 'package:pokedex_scaffold/core/base/base_bloc.dart';
import 'package:pokedex_scaffold/core/models/dto/pokemon_detail_dto.dart';
import 'package:pokedex_scaffold/core/models/dto/species_dto.dart';
import 'package:pokedex_scaffold/core/models/enum/pokemon_type.dart';
import 'package:pokedex_scaffold/core/models/form/pokemon_detail.dart';
import 'package:pokedex_scaffold/core/models/form/pokemon_type_data.dart';
import 'package:pokedex_scaffold/core/models/form/stat.dart';
import 'package:pokedex_scaffold/core/repositories/generic_repository.dart';
import 'package:pokedex_scaffold/core/repositories/pokemon_repository.dart';

part 'detail_cubit.freezed.dart';
part 'detail_state.dart';

class DetailCubit extends BaseWsCubit<DetailState> {
  final PokemonRepository pokemonRepository;
  final GenericRepository genericRepository;

  DetailCubit({
    required this.pokemonRepository,
    required this.genericRepository,
  }) : super(const DetailState.valuesSet());

  @override
  Future<void> close() {
    locator.unregister<DetailCubit>();
    return super.close();
  }

  void retrievePokemonDetail({required int id, String language = 'en'}) async {
    emit(DetailState.loading(state));

    try {
      final detailData =
          await pokemonRepository.getPokemonDetail(language: language, id: id.toString());
      if (detailData.sprites?.other?.officialArtwork?.frontDefault == null) {
        throw Exception('Mandatory image null detail data retrieved');
      }

      // Retrieve type names translation
      final List<PokemonTypeData> typesData = [];
      if (detailData.types != null && detailData.types!.isNotEmpty) {
        for (final typeData in detailData.types!) {
          if (typeData.type?.name != null && typeData.type?.translatedName != null) {
            typesData.add(PokemonTypeData(
              name: typeData.type!.translatedName!,
              type: PokemonType.fromName(typeData.type!.name!),
            ));
          }
        }
      }

      // Retrieve species to get descriptions and short description
      String? description;
      List<String>? behaviors;
      if (detailData.species?.url != null) {
        final speciesInfos = SpeciesDTO.fromJson(await genericRepository.getDataFromUrl(
            url: detailData.species!.url!, language: language));

        if (speciesInfos.genera != null && speciesInfos.genera!.isNotEmpty) {
          description = speciesInfos.genera;
        }

        if (speciesInfos.flavorTextEntries != null && speciesInfos.flavorTextEntries!.isNotEmpty) {
          behaviors = speciesInfos.flavorTextEntries!
              .where((behavior) => behavior.flavorText != null)
              .map((behavior) => behavior.flavorText!)
              .map((behavior) => behavior.replaceAll('\n', ' ').replaceAll('\f', ''))
              .toSet()
              .toList();
        }
      }

      // Retrieve stats
      List<Stat> stats = [];
      if (detailData.stats != null) {
        for (final statData in detailData.stats!) {
          if (statData.baseStat != null && statData.stat?.translatedName != null) {
            stats.add(Stat(
              name: statData.stat!.translatedName!,
              value: statData.baseStat!,
            ));
          }
        }
      }

      emit(DetailState.dataFetched(state,
          data: _pokemonDetailConverter(
            detailData,
            typesData,
            description,
            behaviors,
            stats,
          )));
    } catch (e) {
      logger.severe('Error occurred while loading pokemon detail: $e');
      emit(DetailState.errorOccurred(state, error: e));
    }
  }

  PokemonDetail _pokemonDetailConverter(
    PokemonDetailDTO dto,
    List<PokemonTypeData> typesData,
    String? description,
    List<String>? behaviors,
    List<Stat> stats,
  ) =>
      PokemonDetail(
        id: dto.id,
        description: description,
        behaviors: behaviors,
        image: dto.sprites!.other!.officialArtwork!.frontDefault!,
        height: dto.height,
        weight: dto.weight,
        types: typesData
            .where((typeData) =>
                typeData.name != null && typeData.name!.isNotEmpty && typeData.type != null)
            .toList(),
        stats: stats,
      );
}
