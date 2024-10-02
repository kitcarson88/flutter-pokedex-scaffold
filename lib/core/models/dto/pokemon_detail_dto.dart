import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_scaffold/core/models/dto/cries_dto.dart';
import 'package:pokedex_scaffold/core/models/dto/name_url_dto.dart';
import 'package:pokedex_scaffold/core/models/dto/sprites_dto.dart';
import 'package:pokedex_scaffold/core/models/dto/stat_dto.dart';
import 'package:pokedex_scaffold/core/models/dto/type_dto.dart';

part 'pokemon_detail_dto.freezed.dart';
part 'pokemon_detail_dto.g.dart';

@freezed
class PokemonDetailDTO with _$PokemonDetailDTO {
  const factory PokemonDetailDTO({
    @Default(null) int? id,
    @Default(null) CriesDTO? cries,
    @Default(null) int? height,
    @Default(null) int? weight,
    @Default(null) SpritesDTO? sprites,
    @Default(null) NameUrlDTO? species,
    @Default(null) List<TypeDTO>? types,
    @Default(null) List<StatDTO>? stats,
  }) = _PokemonDetailDTO;

  factory PokemonDetailDTO.fromJson(Map<String, dynamic> json) => _$PokemonDetailDTOFromJson(json);
}
