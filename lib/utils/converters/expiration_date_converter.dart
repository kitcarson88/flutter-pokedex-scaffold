import 'package:freezed_annotation/freezed_annotation.dart';

class ExpirationDateConverter implements JsonConverter<DateTime?, int?> {
  const ExpirationDateConverter();

  @override
  DateTime? fromJson(int? json) {
    if (json == null) {
      final now = DateTime.now();
      return DateTime(now.year, now.month, now.day, now.hour, now.minute, now.second + json!,
          now.millisecond, now.microsecond);
    }

    return null;
  }

  @override
  int? toJson(DateTime? object) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
