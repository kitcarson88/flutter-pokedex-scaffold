// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pokedex_scaffold/core/models/enum/pokemon_type.dart';

class PokemonTypeData {
  final String? name;
  final PokemonType? type;
  const PokemonTypeData({
    this.name,
    this.type,
  });

  PokemonTypeData copyWith({
    String? name,
    PokemonType? type,
  }) =>
      PokemonTypeData(
        name: name ?? this.name,
        type: type ?? this.type,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'type': type?.toShortString(),
      };

  factory PokemonTypeData.fromMap(Map<String, dynamic> map) => PokemonTypeData(
        name: map['name'] != null ? map['name'] ?? '' : null,
        type: map['type'] != null ? PokemonType.fromName(map['type'] as String) : null,
      );

  String toJson() => json.encode(toMap());

  factory PokemonTypeData.fromJson(String source) =>
      PokemonTypeData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PokemonTypeData(name: $name, type: $type)';

  @override
  bool operator ==(covariant PokemonTypeData other) {
    if (identical(this, other)) return true;

    return other.name == name && other.type == type;
  }

  @override
  int get hashCode => name.hashCode ^ type.hashCode;
}
