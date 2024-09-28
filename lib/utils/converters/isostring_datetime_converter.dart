// ignore_for_file: avoid_print

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_scaffold/utils/extensions/datetime.dart';

class IsoStringDatetimeConverter implements JsonConverter<DateTime?, String?> {
  const IsoStringDatetimeConverter();

  @override
  DateTime? fromJson(String? json) {
    if (json != null) {
      try {
        return json.parse();
      } on FormatException catch (e) {
        print('An error occured on iso string date formatting $e');
      }
    }

    return null;
  }

  @override
  String? toJson(DateTime? object) => object?.toIso8601String();
}
