// ignore_for_file: avoid_print

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_scaffold/utils/extensions/datetime.dart';

class YyyymmddDateTimeConverter implements JsonConverter<DateTime?, String?> {
  const YyyymmddDateTimeConverter();

  @override
  DateTime? fromJson(String? json) {
    if (json != null) {
      try {
        return json.parseWithFormatString('yyyy-MM-dd');
      } on FormatException catch (e) {
        print('An error occured on iso string date formatting $e');
      }
    }

    return null;
  }

  @override
  String? toJson(DateTime? object) => object?.yyyyMMddWithHyphen;
}
