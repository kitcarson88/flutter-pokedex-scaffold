import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension DarkMode on BuildContext {
  bool isDarkMode() {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }

  bool isRtl() {
    final directionality = Directionality.of(this);
    return directionality == TextDirection.rtl;
  }

  AppLocalizations get localization => AppLocalizations.of(this);

  Locale get locale => Localizations.localeOf(this);
}
