import 'dart:developer';

import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:logging/logging.dart';

void configureLogger() {
  if (kReleaseMode) {
    // Don't log anything below warnings in production.
    Logger.root.level = Level.SHOUT;
  } else {
    Logger.root.level = Level.ALL;
  }

  Logger.root.onRecord.listen((record) {
    log('${_color(record.level)}${record.level.name}: ${record.time}: '
        '${record.loggerName}: '
        '${record.message}\x1B[0m');
  });
}

String _color(Level level) {
  if (level == Level.SEVERE || level == Level.SHOUT) {
    return '\x1B[31m';
  }

  if (level == Level.WARNING) {
    return '\x1B[33m';
  }

  if (level == Level.FINE || level == Level.FINER || level == Level.FINEST) {
    return '\x1B[32m';
  }

  return '\x1B[34m';
}
