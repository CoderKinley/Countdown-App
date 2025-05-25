import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:to_do_list/widgets/countdown_detailed_card_widget.dart';

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
              Row(),
              const Text("Add Image"),
              SizedBox(
                height: 120, // Set a fixed height
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _ShowImageCart(),
                    _ShowImageCart(),
                    _ShowImageCart(),
                    _ShowImageCart(),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add your image selection logic here
                },
                child: const Text("Select Image"),
              ),
            ],
          ),
        ),
        body: Center(
          child: CountdownDetailedCardWidget(
            days: '1',
            label: 'the',
            date: 'd',
            title: 'Anniversary',
            backgroundImagePath: 'path',
          ),
        ),
      ),
    );
  }

  Widget _ShowImageCart() {
    return Card(child: Text("Hello!"));
  }
}

// reference for teh sliding up panel
// https://flutterappworld.com/a-draggable-flutter-widget-that-makes-implementing-a-slidinguppanel-much-easier/
