import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/countdown_detailed_card_widget.dart';

class CountdownDetailScreen extends StatelessWidget {
  final String days;
  final String label;
  final String date;
  final String title;
  final String backgroundImagePath;

  const CountdownDetailScreen({
    super.key,
    required this.days,
    required this.label,
    required this.date,
    required this.title,
    required this.backgroundImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: CountdownDetailedCardWidget(
        days: days,
        label: label,
        date: date,
        title: title,
        backgroundImagePath: backgroundImagePath,
      ),
    );
  }
}
