import 'package:flutter/material.dart';

class ThemeState {
  final ThemeMode themeMode;

  ThemeState({required this.themeMode});

  factory ThemeState.initial() => ThemeState(themeMode: ThemeMode.system);
}
