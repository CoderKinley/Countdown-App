import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart'; // Import the AppDrawer widget

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make AppBar transparent
        elevation: 0, // Remove shadow
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ), // Menu icon on the left
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
            );
          },
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ), // Add title
      ),
      extendBodyBehindAppBar: true, // Extend body behind the AppBar
      drawer: const AppDrawer(), // Add the AppDrawer
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'john.doe@example.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.edit),
                    title: const Text('Edit Profile'),
                    onTap: () {
                      // TODO: Implement edit profile
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.security),
                    title: const Text('Security'),
                    onTap: () {
                      // TODO: Implement security settings
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.history),
                    title: const Text('Activity History'),
                    onTap: () {
                      // TODO: Show activity history
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
                    leading: const Icon(Icons.help),
                    title: const Text('Help & Support'),
                    onTap: () {
                      // TODO: Show help & support
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                    onTap: () {
                      // TODO: Implement logout
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
