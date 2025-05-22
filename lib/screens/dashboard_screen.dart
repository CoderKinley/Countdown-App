import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart'; // Import the AppDrawer widget
import '../widgets/bottom_nav_items.dart';
import 'navigation/home_screen.dart';
import 'navigation/calendar_screen.dart';
import 'navigation/countdown_screen.dart';
import 'navigation/profile_screen.dart';
import 'navigation/add_countdown_screen.dart';
import 'countdown screen/countdown_detail_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CalendarScreen(),
    const CountdownScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
          'DAYS TO',
          style: TextStyle(color: Colors.white),
        ), // Add title
      ),
      extendBodyBehindAppBar: true, // Extend body behind the AppBar
      drawer: const AppDrawer(), // Add the AppDrawer
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        shape:
            const CircularNotchedRectangle(), // This creates a notch for the FAB
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...BottomNavItems.items.map(
              (item) => IconButton(
                icon: Icon(
                  item.icon,
                  color:
                      _selectedIndex == item.index
                          ? Colors.blueAccent
                          : Colors.white,
                ),
                onPressed: () => _onItemTapped(item.index),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(color: Colors.white, width: 2),
        ),
        child: const Icon(Icons.add, size: 32, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddCountdownScreen()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// Separate widget for the home content
class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: [
                  _buildCountdownCard(
                    '1',
                    'Day To',
                    'May 22, 2025',
                    'Coding',
                    'assets/images/background_dark.jpg',
                  ),
                  const SizedBox(height: 4),
                  _buildCountdownCard(
                    '21',
                    'Day To',
                    'May 22, 2025',
                    'Flutter',
                    'assets/images/ourImage.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountdownCard(
    String days,
    String label,
    String date,
    String title,
    String backgroundImagePath,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => CountdownDetailScreen(
                  days: days,
                  label: label,
                  date: date,
                  title: title,
                  backgroundImagePath: backgroundImagePath,
                ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundImagePath),
              fit: BoxFit.cover,
              alignment: Alignment(0, 1), // This flips the image upside down
              colorFilter: ColorFilter.mode(
                const Color.fromRGBO(0, 0, 0, 0.4),
                BlendMode.darken,
              ),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, const Color.fromRGBO(0, 0, 0, 0.8)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  days,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    height: 1.0,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black45,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 14,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 1,
                      height: 14,
                      color: Colors.white.withOpacity(0.4),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white.withOpacity(0.9),
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
