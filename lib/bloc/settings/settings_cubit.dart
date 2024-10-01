import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'settings_cubit.freezed.dart';
part 'settings_state.dart';

@singleton
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState.updated());

  void setLanguage(Locale? locale) {
    emit(SettingsState.updateLocale(state, locale: locale));
  }

  void setTheme(ThemeMode theme) {
    emit(SettingsState.updateTheme(state, theme: theme));
  }
}
