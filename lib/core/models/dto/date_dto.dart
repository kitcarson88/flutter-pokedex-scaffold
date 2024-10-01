import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_scaffold/utils/converters/isostring_datetime_converter.dart';

part 'date_dto.freezed.dart';
part 'date_dto.g.dart';

@freezed
class DateDTO with _$DateDTO {
  const factory DateDTO({
    @Default(null) @IsoStringDatetimeConverter() DateTime? date,
  }) = _DateDTO;

  factory DateDTO.fromJson(Map<String, dynamic> json) => _$DateDTOFromJson(json);
}
