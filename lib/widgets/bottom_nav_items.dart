import 'package:flutter/material.dart';

class BottomNavItem {
  final IconData icon;
  final String label;
  final int index;

  const BottomNavItem({
    required this.icon,
    required this.label,
    required this.index,
  });
}

class BottomNavItems {
  static const List<BottomNavItem> items = [
    BottomNavItem(icon: Icons.home, label: 'Home', index: 0),
    BottomNavItem(icon: Icons.calendar_today, label: 'Calendar', index: 1),
    BottomNavItem(icon: Icons.timer, label: 'Countdown', index: 2),
    BottomNavItem(icon: Icons.person, label: 'Profile', index: 3),
  ];
}
