import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pokedex_scaffold/bloc/settings/settings_cubit.dart';
import 'package:pokedex_scaffold/configs/singleton_locator.dart';
import 'package:pokedex_scaffold/core/base/base_view.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_dropdown_button.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';
import 'package:pokedex_scaffold/utils/extensions/string.dart';
import 'package:pokedex_scaffold/utils/no_effects_scroll_behavior.dart';

@RoutePage()
class SettingsView extends BaseStatelessView {
  SettingsView({super.key})
      : super(
          baseViewData: BaseViewData(
            appBarConfiguration: AppBarData(
              titleBuilder: (context) => context.localization.settings.capitalize(),
            ),
          ),
        );

  @override
  Widget body(BuildContext context) => ScrollConfiguration(
        behavior: NoEffectsScrollBehavior(),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Padding(
              padding: AppTheme.sidePadding.add(AppTheme.defaultTopPadding),
              child: PokedexScaffoldDropdownButton<Locale>(
                title: context.localization.language.capitalize(),
                current: locator<SettingsCubit>().state.locale,
                nullValueSelectable: true,
                items: [
                  PokedexScaffoldDropdownItem(
                    key: null,
                    value: context.localization.systemLanguage.capitalize(),
                  ),
                  for (final supportedLocale in AppLocalizations.supportedLocales)
                    PokedexScaffoldDropdownItem(
                      key: supportedLocale,
                      value: _translatedLanguageNameFromLanguageCode(
                              context, supportedLocale.languageCode)
                          .capitalize(),
                    ),
                ],
                onItemSelect: (locale) {
                  locator<SettingsCubit>().setLanguage(locale);
                },
              ),
            ),
            Padding(
              padding: AppTheme.sidePadding.add(AppTheme.defaultTopPadding),
              child: PokedexScaffoldDropdownButton<ThemeMode>(
                title: context.localization.theme.capitalize(),
                current: locator<SettingsCubit>().state.theme,
                items: [
                  for (final themeMode in ThemeMode.values)
                    PokedexScaffoldDropdownItem(
                      key: themeMode,
                      value: _translatedThemeNameFromBrightness(context, themeMode).capitalize(),
                    ),
                ],
                onItemSelect: (mode) {
                  if (mode != null) {
                    locator<SettingsCubit>().setTheme(mode);
                  }
                },
              ),
            ),
          ],
        ),
      );

  String _translatedThemeNameFromBrightness(BuildContext context, ThemeMode themeMode) {
    String theme;

    switch (themeMode) {
      case ThemeMode.light:
        theme = context.localization.light;
        break;
      case ThemeMode.dark:
        theme = context.localization.dark;
        break;
      case ThemeMode.system:
        theme = context.localization.systemTheme;
        break;
      default:
        theme = context.localization.systemTheme;
        break;
    }

    return theme;
  }

  String _translatedLanguageNameFromLanguageCode(BuildContext context, String languageCode) {
    String language;

    switch (languageCode) {
      case 'it':
        language = context.localization.it;
        break;
      case 'en':
        language = context.localization.en;
        break;
      case 'es':
        language = context.localization.es;
        break;
      case 'ar':
        language = context.localization.ar;
        break;
      default:
        language = context.localization.en;
        break;
    }

    return language;
  }
}
