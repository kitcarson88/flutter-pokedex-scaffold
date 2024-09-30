import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_scaffold/core/models/dto/names_dto.dart';

part 'stat_detail_dto.freezed.dart';
part 'stat_detail_dto.g.dart';

@freezed
class StatDetailDTO with _$StatDetailDTO {
  const factory StatDetailDTO({
    @Default(null) String? name,
    @Default(null) List<NamesDTO>? names,
  }) = _StatDetailDTO;

  factory StatDetailDTO.fromJson(Map<String, dynamic> json) => _$StatDetailDTOFromJson(json);
}
