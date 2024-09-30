import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_scaffold/core/models/dto/flavor_text_dto.dart';
import 'package:pokedex_scaffold/core/models/dto/name_url_dto.dart';

part 'species_dto.freezed.dart';
part 'species_dto.g.dart';

@freezed
class SpeciesDTO with _$SpeciesDTO {
  const factory SpeciesDTO({
    @Default(null) @JsonKey(name: 'base_happiness') int? baseHappiness,
    @Default(null) @JsonKey(name: 'capture_rate') int? captureRate,
    @Default(null) @JsonKey(name: 'evolution_chain') NameUrlDTO? evolutionChain,
    @Default(null) String? genera,
    @Default(null) @JsonKey(name: 'flavor_text_entries') List<FlavorTextDTO>? flavorTextEntries,
    @Default(null) bool? isBaby,
    @Default(null) bool? isLegendary,
    @Default(null) bool? isMythical,
  }) = _SpeciesDTO;

  factory SpeciesDTO.fromJson(Map<String, dynamic> json) => _$SpeciesDTOFromJson(json);
}
