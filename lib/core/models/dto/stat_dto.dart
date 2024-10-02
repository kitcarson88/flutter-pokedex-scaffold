import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_scaffold/core/models/dto/name_url_dto.dart';

part 'stat_dto.freezed.dart';
part 'stat_dto.g.dart';

@freezed
class StatDTO with _$StatDTO {
  const factory StatDTO({
    @Default(null) @JsonKey(name: 'base_stat') int? baseStat,
    @Default(null) int? effort,
    @Default(null) NameUrlDTO? stat,
  }) = _StatDTO;

  factory StatDTO.fromJson(Map<String, dynamic> json) => _$StatDTOFromJson(json);
}
