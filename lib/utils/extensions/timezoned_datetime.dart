import 'package:pokedex_scaffold/utils/extensions/datetime.dart';
import 'package:pokedex_scaffold/utils/typedefs/timezoned_datetime.dart';

extension DateTimeUtils on TimezonedDateTime {
  String _twoDigits(int n) => n >= 10 ? '$n' : '0$n';

  DateTime get datetime => $1;
  Duration get timeZoneOffset => $2;

  String toIso8601String() {
    final (date, offset) = this;

    Duration absOffset = offset.abs();

    String adjustedTimezoneIsostring = date.toIso8601String();

    if (offset.inMicroseconds != 0) {
      adjustedTimezoneIsostring =
          '${adjustedTimezoneIsostring.substring(0, adjustedTimezoneIsostring.length - 1)}${offset.isNegative ? '-' : '+'}${_twoDigits(absOffset.inHours)}:${_twoDigits(absOffset.inMinutes.remainder(60))}';
    }

    return adjustedTimezoneIsostring;
  }
}

extension StringTimezonedDateTimeUtils on String {
  TimezonedDateTime parseIsoString() {
    Duration timezoneOffset;

    if (toUpperCase().contains('Z')) {
      timezoneOffset = Duration.zero;
    } else if (contains('+') || contains('-')) {
      final timezoneString = substring(length - 6);
      final sign = timezoneString[0];
      final hoursMinutesTokens = timezoneString.substring(1).split(':');
      final duration = Duration(
          hours: int.parse(hoursMinutesTokens[0]), minutes: int.parse(hoursMinutesTokens[1]));
      timezoneOffset = sign == '+' ? duration : Duration.zero - duration;
    } else {
      timezoneOffset = Duration.zero;
    }

    final date = parse().add(timezoneOffset);

    return (date, timezoneOffset);
  }
}
