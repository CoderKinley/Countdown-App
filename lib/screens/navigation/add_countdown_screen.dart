import 'package:flutter/material.dart';

class AddCountdownScreen extends StatefulWidget {
  const AddCountdownScreen({super.key});

  @override
  State<AddCountdownScreen> createState() => _AddCountdownScreenState();
}

class _AddCountdownScreenState extends State<AddCountdownScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Add Countdown',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Text(
          'Add Countdown Form',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
