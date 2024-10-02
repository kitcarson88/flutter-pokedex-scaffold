// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';
import 'package:pokedex_scaffold/utils/extensions/string.dart';

extension DateTimeUtils on DateTime {
  String format(String formatString) => DateFormat(formatString).format(this);
  String formatLocalized(String formatString, String? locale) =>
      DateFormat(formatString, locale).format(this);

  String get ddMMyyyyWithSlash => format('dd/MM/yyyy');
  String get yyyyMMddWithHyphen => format('yyyy-MM-dd');
  String get HHmm24HWithColon => format('HH:mm');
  String get HHmm24HWithDot => format('HH.mm');
  String ddMMMyyyyWithSpacesHHmmWithColonSeparatedByHyphen([String? locale]) =>
      '${format('dd')} ${formatLocalized('MMM', locale).capitalize()} ${format('yyyy')} - ${format('HH:mm')}';
  String ddMMMyyyyWithSpacesHHmmssWithColonSeparatedByHyphen([String? locale]) =>
      '${format('dd')} ${formatLocalized('MMM', locale).capitalize()} ${format('yyyy')} - ${format('HH:mm:ss')}';
  String dayOfTheWeek([String? locale]) => formatLocalized('EEEE', locale);
  String dayOfTheWeekThreeLetters([String? locale]) => dayOfTheWeek(locale).substring(0, 3);
  String monthName([String? locale]) => formatLocalized('MMMMM', locale);

  DateTime get dateOnly => DateTime(year, month, day);

  bool get isToday {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final aDate = DateTime(year, month, day);
    return aDate == today;
  }

  bool get isYesterday {
    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final aDate = DateTime(year, month, day);
    return aDate == yesterday;
  }

  bool get isTomorrow {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final aDate = DateTime(year, month, day);
    return aDate == tomorrow;
  }

  static bool areSameYear(DateTime a, DateTime b) {
    final aWithYear = DateTime(a.year);
    final bWithYear = DateTime(b.year);

    return aWithYear == bWithYear;
  }

  static bool areSameDay(DateTime a, DateTime b) {
    final aWithDay = DateTime(a.year, a.month, a.day);
    final bWithDay = DateTime(b.year, b.month, b.day);

    return aWithDay == bWithDay;
  }

  static bool areSameHour(DateTime a, DateTime b) {
    final aWithHours = DateTime(a.year, a.month, a.day, a.hour);
    final bWithHours = DateTime(b.year, b.month, b.day, b.hour);

    return aWithHours == bWithHours;
  }

  static bool areSameMinute(DateTime a, DateTime b) {
    final aWithMinutes = DateTime(a.year, a.month, a.day, a.hour, a.minute);
    final bWithMinutes = DateTime(b.year, b.month, b.day, b.hour, b.minute);

    return aWithMinutes == bWithMinutes;
  }
}

extension DurationDateTimeUtils on Duration {
  String _twoDigits(int n) => n >= 10 ? '$n' : '0$n';

  String get asDateTimeTimeZoneOffset {
    final sign = isNegative ? '-' : '+';
    final duration = abs();
    return '$sign${_twoDigits(duration.inHours)}:${_twoDigits(duration.inMinutes.remainder(60))}';
  }
}

extension StringDateTimeUtils on String {
  DateTime parse() => DateTime.parse(this);

  DateTime parseWithFormatString(String formatString) => DateFormat(formatString).parse(this);
}
