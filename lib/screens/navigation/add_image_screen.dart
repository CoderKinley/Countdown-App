import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AddImageScreen extends StatefulWidget {
  const AddImageScreen({super.key});

  @override
  State<AddImageScreen> createState() => _AddImageScreenState();
}

class _AddImageScreenState extends State<AddImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SlidingUpPanel(
        panel: Container(
          color: const Color.fromARGB(255, 15, 0, 27),
          child: Column(
            children: [
              const Text("Add Image"),
              ElevatedButton(
                onPressed: () {
                  // Add your image selection logic here
                },
                child: const Text("Select Image"),
              ),
            ],
          ),
        ),
        body: Center(child: Text("Main Content")),
      ),
    );
  }
}


// reference for teh sliding up panel
// https://flutterappworld.com/a-draggable-flutter-widget-that-makes-implementing-a-slidinguppanel-much-easier/