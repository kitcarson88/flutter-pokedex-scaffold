import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_scaffold/utils/converters/isostring_timezoned_datetime_converter.dart';
import 'package:pokedex_scaffold/utils/typedefs/timezoned_datetime.dart';

part 'date_with_timezone_dto.freezed.dart';
part 'date_with_timezone_dto.g.dart';

@freezed
class DateWithTimezoneDTO with _$DateWithTimezoneDTO {
  const factory DateWithTimezoneDTO({
    @Default(null) @IsoStringTimezonedDatetimeConverter() TimezonedDateTime? date,
  }) = _DateWithTimezoneDTO;

  factory DateWithTimezoneDTO.fromJson(Map<String, dynamic> json) =>
      _$DateWithTimezoneDTOFromJson(json);
}
