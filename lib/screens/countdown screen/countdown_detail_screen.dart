import 'package:flutter/material.dart';

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
      body: Stack(
        children: [
          // Full screen background image (flipped upside down)
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationX(
              3.14159265359,
            ), // 180 degrees in radians
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(backgroundImagePath),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    const Color.fromRGBO(0, 0, 0, 0.4),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
          ),

          // Centered content with white border
          Center(
            child: IntrinsicWidth(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      days,
                      style: const TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
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
                    Divider(color: Colors.white, height: 1),
                    const SizedBox(height: 8),
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
