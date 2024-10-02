// ignore_for_file: avoid_print

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_scaffold/utils/extensions/timezoned_datetime.dart';
import 'package:pokedex_scaffold/utils/typedefs/timezoned_datetime.dart';

class IsoStringTimezonedDatetimeConverter implements JsonConverter<TimezonedDateTime?, String?> {
  const IsoStringTimezonedDatetimeConverter();

  @override
  TimezonedDateTime? fromJson(String? json) {
    if (json != null) {
      try {
        return json.parseIsoString();
      } on FormatException catch (e) {
        print('An error occured on iso string date formatting $e');
      }
    }

    return null;
  }

  @override
  String? toJson(TimezonedDateTime? object) => object?.toIso8601String();
}
