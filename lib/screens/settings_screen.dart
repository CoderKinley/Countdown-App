import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/theme/theme_bloc.dart';
import '../bloc/theme/theme_state.dart';
import '../bloc/theme/theme_event.dart';
import '../widgets/app_drawer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Text('Settings', style: TextStyle(color: Colors.white)),
      ),
      extendBodyBehindAppBar: true,
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.notifications),
                    title: const Text('Notifications'),
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {
                        // TODO: Implement notification toggle
                      },
                    ),
                  ),
                  const Divider(),
                  BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (context, state) {
                      return ListTile(
                        leading: const Icon(Icons.dark_mode),
                        title: const Text('Dark Mode'),
                        trailing: Switch(
                          value: state.themeMode == ThemeMode.dark,
                          onChanged: (_) {
                            context.read<ThemeBloc>().add(ToggleTheme());
                          },
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text('Language'),
                    trailing: const Text('English'),
                    onTap: () {
                      // TODO: Implement language selection
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('About'),
                    onTap: () {
                      // TODO: Show about dialog
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.backup),
                    title: const Text('Backup Data'),
                    onTap: () {
                      // TODO: Implement backup
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.restore),
                    title: const Text('Restore Data'),
                    onTap: () {
                      // TODO: Implement restore
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
