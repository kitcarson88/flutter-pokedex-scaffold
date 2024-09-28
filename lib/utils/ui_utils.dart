import 'dart:math';

class UiUtils {
  static String integerStringWithFixedCharacters(int value, int chars) {
    var stringIndex = '$value';

    for (var i = 0; i < chars; ++i) {
      if (value < pow(10, i)) {
        stringIndex = '0$stringIndex';
      }
    }

    return stringIndex;
  }
}
