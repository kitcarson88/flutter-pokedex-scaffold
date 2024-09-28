import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class MessageServicesChecker {
  static const MethodChannel _channel = MethodChannel('message_services_checker');

  static Future<bool> isGMS() async =>
      !kIsWeb && Platform.isAndroid && await _channel.invokeMethod('isGMS');
  static Future<bool> isHMS() async =>
      !kIsWeb && Platform.isAndroid && await _channel.invokeMethod('isHMS');
}
