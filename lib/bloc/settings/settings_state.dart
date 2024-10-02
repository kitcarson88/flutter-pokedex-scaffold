part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.updated({
    @Default(null) Locale? locale,
    @Default(ThemeMode.system) ThemeMode theme,
  }) = _SettingsUpdated;

  factory SettingsState.updateLocale(
    SettingsState previousState, {
    required Locale? locale,
  }) =>
      SettingsState.updated(
        locale: locale,
        theme: previousState.theme,
      );

  factory SettingsState.updateTheme(
    SettingsState previousState, {
    required ThemeMode theme,
  }) =>
      SettingsState.updated(
        theme: theme,
        locale: previousState.locale,
      );
}
