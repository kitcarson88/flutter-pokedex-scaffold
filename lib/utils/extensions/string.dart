extension StringUtils on String {
  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';

  String capitalizeWithOtherLowercase() => '${this[0].toUpperCase()}${substring(1).toLowerCase()}';

  String capitalizeAll() => split(' ').map((token) => token.capitalize()).join(' ');

  String wordsOnNewLine() => replaceAll(' ', '\n');
}
