import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pokedex_scaffold/bloc/settings/settings_cubit.dart';
import 'package:pokedex_scaffold/configs/singleton_locator.dart';

extension DarkMode on BuildContext {
  bool isDarkMode() {
    final stateThemeMode = locator<SettingsCubit>().state.theme;

    if (stateThemeMode == ThemeMode.system) {
      final brightness = MediaQuery.of(this).platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return stateThemeMode == ThemeMode.dark;
    }
  }

  bool isRtl() {
    final directionality = Directionality.of(this);
    return directionality == TextDirection.rtl;
  }

  AppLocalizations get localization => AppLocalizations.of(this);

  Locale get locale => Localizations.localeOf(this);
}
