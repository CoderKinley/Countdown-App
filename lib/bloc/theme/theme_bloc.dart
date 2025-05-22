import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SharedPreferences _prefs;
  static const String _themeKey = 'theme_mode';

  ThemeBloc(this._prefs) : super(ThemeState.initial()) {
    on<LoadTheme>(_onLoadTheme);
    on<ToggleTheme>(_onToggleTheme);
  }

  void _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) {
    final isDark = _prefs.getBool(_themeKey) ?? false;
    emit(ThemeState(themeMode: isDark ? ThemeMode.dark : ThemeMode.light));
  }

  void _onToggleTheme(ToggleTheme event, Emitter<ThemeState> emit) {
    final isDark = state.themeMode == ThemeMode.dark;
    final newThemeMode = isDark ? ThemeMode.light : ThemeMode.dark;
    _prefs.setBool(_themeKey, !isDark);
    emit(ThemeState(themeMode: newThemeMode));
  }
}
