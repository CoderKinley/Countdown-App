import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddImageScreen extends StatefulWidget {
  final String? initialImagePath;
  final Function(String?) onImageSelected;

  const AddImageScreen({
    super.key,
    this.initialImagePath,
    required this.onImageSelected,
  });

  @override
  State<AddImageScreen> createState() => _AddImageScreenState();
}

class _AddImageScreenState extends State<AddImageScreen> {
  String? selectedImagePath;

  @override
  void initState() {
    super.initState();
    selectedImagePath = widget.initialImagePath;
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImagePath = image.path;
      });
      widget.onImageSelected(selectedImagePath);
    }
  }

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
        title: const Text('Add Image', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add Image',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(8),
                  image:
                      selectedImagePath != null
                          ? DecorationImage(
                            image: FileImage(File(selectedImagePath!)),
                            fit: BoxFit.cover,
                          )
                          : null,
                ),
                child:
                    selectedImagePath == null
                        ? const Icon(
                          Icons.add_photo_alternate,
                          color: Colors.white,
                          size: 50,
                        )
                        : null,
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.add_photo_alternate),
                label: const Text('Select Image'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
