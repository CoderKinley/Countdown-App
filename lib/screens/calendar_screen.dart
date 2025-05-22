import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart'; // Import the AppDrawer widget

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

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
          'Calendar',
          style: TextStyle(color: Colors.white),
        ), // Add title
      ),
      extendBodyBehindAppBar: true, // Extend body behind the AppBar
      drawer: const AppDrawer(), // Add the AppDrawer
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Calendar',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.chevron_left),
                          onPressed: () {
                            // TODO: Implement previous month
                          },
                        ),
                        const Text(
                          'March 2024',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.chevron_right),
                          onPressed: () {
                            // TODO: Implement next month
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // TODO: Implement calendar grid
                    Container(
                      height: 300,
                      color: Colors.grey[200],
                      child: const Center(
                        child: Text('Calendar Grid Coming Soon'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Upcoming Events',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green[100],
                        child: const Icon(Icons.event, color: Colors.green),
                      ),
                      title: Text('Event ${index + 1}'),
                      subtitle: Text('March ${15 + index}, 2024'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
