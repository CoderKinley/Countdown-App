import 'package:flutter/material.dart';
import 'package:to_do_list/screens/countdown screen/countdown_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              alignment: const Alignment(0, 1),
              colorFilter: ColorFilter.mode(
                const Color.fromRGBO(0, 0, 0, 0.4),
                BlendMode.darken,
              ),
            ),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Color.fromRGBO(0, 0, 0, 0.8)],
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
                        style: const TextStyle(
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
