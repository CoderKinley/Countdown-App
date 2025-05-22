import 'package:flutter/material.dart';

class DrawerItem {
  final IconData icon;
  final String label;
  final String route;

  const DrawerItem({
    required this.icon,
    required this.label,
    required this.route,
  });
}

class DrawerItems {
  static const List<DrawerItem> items = [
    DrawerItem(icon: Icons.dashboard, label: 'Dashboard', route: '/dashboard'),
    DrawerItem(icon: Icons.timer, label: 'Countdown', route: '/countdown'),
    DrawerItem(
      icon: Icons.calendar_today,
      label: 'Calendar',
      route: '/calendar',
    ),
    DrawerItem(icon: Icons.settings, label: 'Settings', route: '/settings'),
    DrawerItem(icon: Icons.person, label: 'Profile', route: '/profile'),
  ];
}
