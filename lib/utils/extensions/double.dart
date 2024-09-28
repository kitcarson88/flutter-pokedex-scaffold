import 'dart:math' as math;

extension DoubleUtils on double {
  double roundToFixedDecimalDigits(int numberOfDecimalDigits) {
    final mod = math.pow(10.0, numberOfDecimalDigits);
    return (this * mod).round().toDouble() / mod;
  }
}
