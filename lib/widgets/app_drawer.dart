import 'package:flutter/material.dart';
import 'drawer_items.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue), // Customize header
            child: Text(
              'Countdown Days',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ...DrawerItems.items.map(
            (item) => _buildDrawerItem(
              icon: item.icon,
              text: item.label,
              onTap: () => _navigateTo(context, item.route),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return ListTile(leading: Icon(icon), title: Text(text), onTap: onTap);
  }

  void _navigateTo(BuildContext context, String routeName) {
    // Close the drawer first
    Navigator.pop(context);
    // Navigate to the new route
    // You will need to define these routes in your MaterialApp
    Navigator.pushReplacementNamed(context, routeName);
  }
}
