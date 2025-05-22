import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/theme/theme_state.dart';
import '../bloc/theme/theme_bloc.dart';
import '../bloc/theme/theme_event.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Switch(
          value: state.themeMode == ThemeMode.dark,
          onChanged: (_) {
            context.read<ThemeBloc>().add(ToggleTheme());
          },
        );
      },
    );
  }
}
