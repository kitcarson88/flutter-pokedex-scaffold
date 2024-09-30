import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_scaffold/core/models/dto/name_url_dto.dart';

part 'type_dto.freezed.dart';
part 'type_dto.g.dart';

@freezed
class TypeDTO with _$TypeDTO {
  const factory TypeDTO({
    @Default(null) int? slot,
    @Default(null) NameUrlDTO? type,
  }) = _TypeDTO;

  factory TypeDTO.fromJson(Map<String, dynamic> json) => _$TypeDTOFromJson(json);
}
