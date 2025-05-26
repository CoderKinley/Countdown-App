import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  final ImagePicker _picker = ImagePicker();
  late String _imagePath;

  @override
  void initState() {
    super.initState();
    _imagePath = widget.backgroundImagePath;
  }

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
        minHeight: 60,
        maxHeight: MediaQuery.of(context).size.height * 0.6,
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
                onPressed: _pickImage,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color.fromARGB(255, 30, 30, 30),
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.zero,
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
            backgroundImagePath: _imagePath,
          ),
        ),
      ),
    );
  }

  Widget _ShowImageCart(String imagePath) {
    final isFile = File(imagePath).existsSync();
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: 120,
        height: 200,
        child:
            isFile
                ? Image.file(File(imagePath), fit: BoxFit.cover)
                : Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }
}


// reference for teh sliding up panel
// https://flutterappworld.com/a-draggable-flutter-widget-that-makes-implementing-a-slidinguppanel-much-easier/