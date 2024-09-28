// ignore_for_file: avoid_print

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_scaffold/core/models/enum/pokemon_type.dart';

class PokemonTypeConverter implements JsonConverter<PokemonType?, String?> {
  const PokemonTypeConverter();

  @override
  PokemonType? fromJson(String? json) {
    if (json != null) {
      try {
        return PokemonType.fromName(json);
      } on FormatException catch (e) {
        print('An error occured on pokemon type formatting $e');
      }
    }

    return null;
  }

  @override
  String? toJson(PokemonType? object) => object?.toShortString();
}
