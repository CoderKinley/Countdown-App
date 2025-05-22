import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../models/reminder_offset.dart';
import '../../models/repeat_type.dart';
import 'add_image_screen.dart';

void main() {
  runApp(const MaterialApp(home: AddCountdownScreen()));
}

class AddCountdownScreen extends StatefulWidget {
  const AddCountdownScreen({super.key});

  @override
  State<AddCountdownScreen> createState() => _AddCountdownScreenState();
}

class _AddCountdownScreenState extends State<AddCountdownScreen> {
  int _currentStep = 0;
  String eventTitle = '';
  DateTime selectedDate = DateTime.now().add(const Duration(days: 1));
  RepeatType repeatOption = RepeatType.none;
  TimeOfDay notificationTime = const TimeOfDay(hour: 9, minute: 0);
  String? selectedImagePath;
  Map<ReminderOffset, bool> reminderOptions = {
    ReminderOffset.onEventDay: true,
    ReminderOffset.oneDayBefore: true,
    ReminderOffset.threeDaysBefore: true,
    ReminderOffset.sevenDaysBefore: true,
    ReminderOffset.fifteenDaysBefore: false,
    ReminderOffset.thirtyDaysBefore: false,
  };

  List<Map<String, dynamic>> savedReminders = [];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: notificationTime,
    );
    if (picked != null && picked != notificationTime) {
      setState(() {
        notificationTime = picked;
      });
    }
  }

  void _toggleReminderOption(ReminderOffset offset) {
    setState(() {
      reminderOptions[offset] = !reminderOptions[offset]!;
    });
  }

  void _saveReminder() {
    setState(() {
      savedReminders.add({
        'title': eventTitle,
        'date': selectedDate,
        'time': notificationTime,
        'repeat': repeatOption,
        'imagePath': selectedImagePath,
        'reminders':
            reminderOptions.entries
                .where((entry) => entry.value)
                .map((entry) => entry.key)
                .toList(),
      });
      // Reset form
      eventTitle = '';
      selectedDate = DateTime.now().add(const Duration(days: 1));
      notificationTime = const TimeOfDay(hour: 9, minute: 0);
      selectedImagePath = null;
      repeatOption = RepeatType.none;
      reminderOptions = {
        ReminderOffset.onEventDay: true,
        ReminderOffset.oneDayBefore: true,
        ReminderOffset.threeDaysBefore: true,
        ReminderOffset.sevenDaysBefore: true,
        ReminderOffset.fifteenDaysBefore: false,
        ReminderOffset.thirtyDaysBefore: false,
      };
    });
  }

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  Future<void> _navigateToImageScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => AddImageScreen(
              initialImagePath: selectedImagePath,
              onImageSelected: (path) {
                setState(() {
                  selectedImagePath = path;
                });
              },
            ),
      ),
    );
  }

  String _getRepeatTypeText(RepeatType type) {
    switch (type) {
      case RepeatType.none:
        return 'Don\'t Repeat';
      case RepeatType.daily:
        return 'Daily';
      case RepeatType.weekly:
        return 'Weekly';
      case RepeatType.monthly:
        return 'Monthly';
      case RepeatType.yearly:
        return 'Yearly';
    }
  }

  String _getReminderOffsetText(ReminderOffset offset) {
    switch (offset) {
      case ReminderOffset.onEventDay:
        return 'On event day';
      case ReminderOffset.oneDayBefore:
        return '1 day before';
      case ReminderOffset.threeDaysBefore:
        return '3 days before';
      case ReminderOffset.sevenDaysBefore:
        return '7 days before';
      case ReminderOffset.fifteenDaysBefore:
        return '15 days before';
      case ReminderOffset.thirtyDaysBefore:
        return '30 days before';
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
        title: const Text(
          'Add Countdown',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          if (_currentStep == 0 || _currentStep == 1)
            TextButton(
              onPressed: _nextStep,
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
        ],
      ),
      body:
          _currentStep == 0
              ? _buildFormStep()
              : _currentStep == 1
              ? _buildImageStep()
              : _buildRemindersStep(),
    );
  }

  Widget _buildFormStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Day To',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Enter title',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 8),
          TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Event title',
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              filled: true,
              fillColor: Colors.grey[900],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              setState(() {
                eventTitle = value;
              });
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Event Date',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => _selectDate(context),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Icon(Icons.calendar_today, color: Colors.white),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Repeat Event',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    color: Colors.grey[900],
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children:
                          RepeatType.values.map((type) {
                            return ListTile(
                              title: Text(
                                _getRepeatTypeText(type),
                                style: const TextStyle(color: Colors.white),
                              ),
                              onTap: () {
                                setState(() {
                                  repeatOption = type;
                                });
                                Navigator.pop(context);
                              },
                            );
                          }).toList(),
                    ),
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _getRepeatTypeText(repeatOption),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Reminder Notification',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Notification Time',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => _selectTime(context),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    notificationTime.format(context),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Icon(Icons.access_time, color: Colors.white),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          ...reminderOptions.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Checkbox(
                    value: entry.value,
                    onChanged: (value) => _toggleReminderOption(entry.key),
                    fillColor: MaterialStateProperty.resolveWith<Color>((
                      Set<MaterialState> states,
                    ) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.blue;
                      }
                      return Colors.grey;
                    }),
                  ),
                  Text(
                    _getReminderOffsetText(entry.key),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildImageStep() {
    return Center(
      child: ElevatedButton.icon(
        onPressed: _navigateToImageScreen,
        icon: const Icon(Icons.add_photo_alternate),
        label: const Text('Select Image'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    );
  }

  Widget _buildRemindersStep() {
    return Column(
      children: [
        Expanded(
          child:
              savedReminders.isEmpty
                  ? const Center(
                    child: Text(
                      'No reminders saved yet',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                  : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: savedReminders.length,
                    itemBuilder: (context, index) {
                      final reminder = savedReminders[index];
                      return Card(
                        color: Colors.grey[900],
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (reminder['imagePath'] != null)
                                Container(
                                  width: double.infinity,
                                  height: 200,
                                  margin: const EdgeInsets.only(bottom: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: FileImage(
                                        File(reminder['imagePath']),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              Text(
                                reminder['title'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${reminder['date'].month}/${reminder['date'].day}/${reminder['date'].year} at ${reminder['time'].format(context)}',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Repeat: ${_getRepeatTypeText(reminder['repeat'])}',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Reminders: ${(reminder['reminders'] as List<ReminderOffset>).map(_getReminderOffsetText).join(', ')}',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _prevStep,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: const BorderSide(color: Colors.blue),
                  ),
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    _saveReminder();
                    _prevStep();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
