import 'package:flutter/material.dart';

class CountdownDetailedCardWidget extends StatelessWidget {
  final String days;
  final String label;
  final String date;
  final String title;
  final String backgroundImagePath;
  final bool showBackground;

  const CountdownDetailedCardWidget({
    super.key,
    required this.days,
    required this.label,
    required this.date,
    required this.title,
    required this.backgroundImagePath,
    this.showBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (showBackground)
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationX(0),
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
        Center(
          child: IntrinsicWidth(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
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
                  const Divider(color: Colors.white, height: 1),
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
    );
  }
}
