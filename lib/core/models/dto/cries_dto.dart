import 'package:freezed_annotation/freezed_annotation.dart';

part 'cries_dto.freezed.dart';
part 'cries_dto.g.dart';

@freezed
class CriesDTO with _$CriesDTO {
  const factory CriesDTO({
    @Default(null) String? latest,
    @Default(null) String? legacy,
  }) = _CriesDTO;

  factory CriesDTO.fromJson(Map<String, dynamic> json) => _$CriesDTOFromJson(json);
}
