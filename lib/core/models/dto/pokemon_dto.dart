import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_scaffold/core/models/enum/pokemon_type.dart';
import 'package:pokedex_scaffold/utils/converters/pokemon_type_converter.dart';

part 'pokemon_dto.freezed.dart';
part 'pokemon_dto.g.dart';

@freezed
class PokemonDTO with _$PokemonDTO {
  const PokemonDTO._();

  const factory PokemonDTO({
    @Default(null) int? id,
    @Default(null) String? name,
    @Default(null) String? description,
    @Default(null) String? thumbnail,
    @Default(null) @JsonKey(name: 'main-type') @PokemonTypeConverter() PokemonType? mainType,
    @Default(null)
    @JsonKey(name: 'other-types')
    @PokemonTypeConverter()
    List<PokemonType>? otherTypes,
  }) = _PokemonDTO;

  factory PokemonDTO.fromJson(Map<String, dynamic> json) => _$PokemonDTOFromJson(json);

  @override
  String toString() =>
      'PokemonDTO(name: $name, description: ${description?.substring(0, 10)}..., thumbnail: $thumbnail, mainType: $mainType, otherTypes: $otherTypes)';
}
