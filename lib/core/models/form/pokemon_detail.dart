// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:pokedex_scaffold/core/models/form/pokemon_type_data.dart';
import 'package:pokedex_scaffold/core/models/form/stat.dart';

class PokemonDetail {
  final int? id;
  final String? name;
  final String? description;
  final String? image;
  final List<PokemonTypeData>? types;
  final int? height;
  final int? weight;
  final List<String>? behaviors;
  final List<Stat>? stats;

  const PokemonDetail({
    this.id,
    this.name,
    this.description,
    this.image,
    this.types,
    this.height,
    this.weight,
    this.behaviors,
    this.stats,
  });

  PokemonDetail copyWith({
    int? id,
    String? name,
    String? description,
    String? image,
    List<PokemonTypeData>? types,
    int? height,
    int? weight,
    List<String>? behaviors,
    List<Stat>? stats,
  }) =>
      PokemonDetail(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
        types: types ?? this.types,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        behaviors: behaviors ?? this.behaviors,
        stats: stats ?? this.stats,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
        'description': description,
        'image': image,
        'types': types?.map((x) => x.toMap()).toList(growable: false),
        'height': height,
        'weight': weight,
        'behaviors': behaviors,
        'stats': stats?.map((x) => x.toMap()).toList(growable: false),
      };

  factory PokemonDetail.fromMap(Map<String, dynamic> map) => PokemonDetail(
        id: map['id'] != null ? map['id'] ?? 0 : null,
        name: map['name'] != null ? map['name'] ?? '' : null,
        description: map['description'] != null ? map['description'] ?? '' : null,
        image: (map['image'] ?? '') as String,
        types: map['types'] != null
            ? List<PokemonTypeData>.from(
                ((map['types']) as List).map<PokemonTypeData?>((x) => PokemonTypeData.fromMap(
                    (x ?? Map<String, dynamic>.from({})) as Map<String, dynamic>)),
              )
            : null,
        height: map['height'] != null ? map['height'] ?? 0 : null,
        weight: map['weight'] != null ? map['weight'] ?? 0 : null,
        behaviors: map['behaviors'] != null
            ? List<String>.from(
                (map['behaviors']) as List<String>,
              )
            : null,
        stats: map['stats'] != null
            ? List<Stat>.from(
                ((map['stats']) as List).map<Stat?>((x) =>
                    Stat.fromMap((x ?? Map<String, dynamic>.from({})) as Map<String, dynamic>)),
              )
            : null,
      );

  String toJson() => json.encode(toMap());

  factory PokemonDetail.fromJson(String source) =>
      PokemonDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PokemonDetail(id: $id, name: $name, description: $description, image: $image, types: $types, height: $height, weight: $weight, behaviors: $behaviors, stats: $stats)';

  @override
  bool operator ==(covariant PokemonDetail other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.image == image &&
        listEquals(other.types, types) &&
        other.height == height &&
        other.weight == weight &&
        listEquals(other.behaviors, behaviors) &&
        listEquals(other.stats, stats);
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      image.hashCode ^
      types.hashCode ^
      height.hashCode ^
      weight.hashCode ^
      behaviors.hashCode ^
      stats.hashCode;
}
