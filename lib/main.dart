import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/theme/theme_state.dart';
import 'screens/dashboard_screen.dart';
import 'screens/countdown_screen.dart';
import 'screens/calendar_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/profile_screen.dart';
import 'bloc/theme/theme_bloc.dart';
import 'bloc/theme/theme_event.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(prefs)..add(LoadTheme()),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              useMaterial3: true,
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.blue,
              useMaterial3: true,
              brightness: Brightness.dark,
            ),
            themeMode: state.themeMode,
            routes: {
              '/dashboard': (context) => const DashboardScreen(),
              '/countdown': (context) => const CountdownScreen(),
              '/calendar': (context) => const CalendarScreen(),
              '/settings': (context) => const SettingsScreen(),
              '/profile': (context) => const ProfileScreen(),
            },
            initialRoute: '/dashboard',
          );
        },
      ),
    );
  }
}
