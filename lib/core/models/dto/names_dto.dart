import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_scaffold/core/models/dto/name_url_dto.dart';

part 'names_dto.freezed.dart';
part 'names_dto.g.dart';

@freezed
class NamesDTO with _$NamesDTO {
  const factory NamesDTO({
    @Default(null) String? name,
    @Default(null) NameUrlDTO? language,
  }) = _NamesDTO;

  factory NamesDTO.fromJson(Map<String, dynamic> json) => _$NamesDTOFromJson(json);
}
