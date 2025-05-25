import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:to_do_list/widgets/countdown_detailed_card_widget.dart';

class AddImageScreen extends StatefulWidget {
  final String days;
  final String label;
  final String date;
  final String title;
  final String backgroundImagePath;

  const AddImageScreen({
    super.key,
    required this.days,
    required this.label,
    required this.date,
    required this.title,
    required this.backgroundImagePath,
  });

  @override
  State<AddImageScreen> createState() => _AddImageScreenState();
}

class _AddImageScreenState extends State<AddImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SlidingUpPanel(
        backdropEnabled: true,
        backdropOpacity: 0.5,
        backdropColor: Colors.black,
        color: Colors.transparent,
        boxShadow: const [],
        minHeight: 60, // visible when collapsed
        maxHeight:
            MediaQuery.of(context).size.height *
            0.6, // slide up to 85% of screen height
        panel: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Container(
                width: 30,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 12),
              const Text("Select Image", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    7,
                    (_) => _ShowImageCart(widget.backgroundImagePath),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add your image selection logic here
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color.fromARGB(255, 30, 30, 30),
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide.none,
                  ),
                ),
                child: Container(
                  width: 120,
                  height: 200,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.add_a_photo,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: CountdownDetailedCardWidget(
            days: widget.days,
            label: widget.label,
            date: widget.date,
            title: widget.title,
            backgroundImagePath: widget.backgroundImagePath,
          ),
        ),
      ),
    );
  }

  Widget _ShowImageCart(String imagePath) {
    return Card(
      clipBehavior:
          Clip.antiAlias, // ensures image clips to the rounded corners
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: 120,
        height: 200,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover, // fills the entire card
        ),
      ),
    );
  }
}

// reference for teh sliding up panel
// https://flutterappworld.com/a-draggable-flutter-widget-that-makes-implementing-a-slidinguppanel-much-easier/
