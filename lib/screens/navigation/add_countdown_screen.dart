import 'package:flutter/material.dart';
import 'package:to_do_list/helper/calculate_day.dart';
import 'package:to_do_list/models/reminder_offset.dart';
import 'package:to_do_list/models/repeat_type.dart';
import 'package:to_do_list/screens/navigation/add_image_screen.dart';
import 'package:to_do_list/utils/extensions.dart';
import 'package:to_do_list/widgets/countdown_detailed_card_widget.dart';

class AddCountdownScreen extends StatefulWidget {
  const AddCountdownScreen({super.key});

  @override
  State<AddCountdownScreen> createState() => _AddCountdownScreenState();
}

class _AddCountdownScreenState extends State<AddCountdownScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _eventRepeatController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _notificationController = TextEditingController();
  DateTime? _selectedDate;
  RepeatType? _selectedRepeatType;
  bool _isChecked = false;
  String _label = "Day To";
  String _eventDate = "";
  String _titleCard = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _titleController.addListener(() {
      setState(() {
        _titleCard = _titleController.text;
      });
    });

    _dateController.addListener(() {
      setState(() {
        _eventDate = _dateController.text;
      });
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _dateController.dispose();
    _eventRepeatController.dispose();
    _notificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text("Next", style: TextStyle(fontSize: 16)),
            ),
            onTap: () {
              if (_formKey.currentState!.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddImageScreen(),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 80),
          child: Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 1, 21, 37),
                  ),
                  width: double.infinity,
                  height: 300,
                  child: CountdownDetailedCardWidget(
                    days: CalculateDay.getDayDifference(_selectedDate),
                    label: _label,
                    date: _dateController.text,
                    title: _titleCard,
                    backgroundImagePath: 'assets/images/ourImage.jpg',
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            labelText: 'Event Title',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a title';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _dateController,
                          decoration: InputDecoration(
                            hintText: "Event Date",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: UnderlineInputBorder(),
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                          readOnly: true,
                          onTap: () => _selectDate(context),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a date';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _eventRepeatController,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            suffixIcon: Icon(Icons.repeat),
                            hintText: "Event Repeat",
                          ),
                          onTap: () {
                            showRepeatTypeModal();
                          },

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter event repeat';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        MediaQuery.removePadding(
                          context: context,
                          removeLeft: true,
                          removeRight: true,
                          removeTop: true,
                          removeBottom: true,
                          child: ListTile(
                            contentPadding:
                                EdgeInsets.zero, // also ensure this is zero
                            leading: Icon(Icons.notification_add),
                            title: Text("Notification Reminder"),
                            trailing: Switch(
                              value: _isChecked,
                              onChanged: (value) {
                                setState(() {
                                  _isChecked = value;
                                });
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                        Visibility(
                          visible: _isChecked,
                          child: Container(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _notificationController,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText: "Reminder Time",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey[800]!,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey[800],
                                    hintStyle: TextStyle(color: Colors.white),
                                    suffixIcon: Icon(Icons.alarm),
                                  ),
                                  onTap: () {
                                    _selectTime(context);
                                  },
                                ),
                                const SizedBox(height: 20),
                                LayoutBuilder(
                                  builder: (context, constraints) {
                                    // Adjust crossAxisCount based on screen width
                                    int crossAxisCount =
                                        constraints.maxWidth > 250 ? 3 : 2;

                                    return GridView.count(
                                      physics: AlwaysScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      crossAxisCount: crossAxisCount,
                                      crossAxisSpacing: 1,
                                      mainAxisSpacing: 1,
                                      childAspectRatio: 4,
                                      padding: EdgeInsets.all(0),
                                      children:
                                          ReminderOffset.values.map((offset) {
                                            return _notificationCard(offset);
                                          }).toList(),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _notificationCard(ReminderOffset offset) {
    return Card(
      color: Colors.blueGrey[900],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Icon(Icons.check, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                offset.displayName,
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // show the panel from the below to rise above
  void showRepeatTypeModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          ),
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 30,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag handle
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 15),

              // Title
              Text(
                "Select Repeat Type",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Options list
              ...RepeatType.values.map((type) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: Text(
                      type.displayName,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    onTap: () {
                      setState(() {
                        _selectedRepeatType = type;
                        _eventRepeatController.text = type.displayName;
                      });
                      Navigator.pop(context);
                    },
                  ),
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }

  // display a clock to set the time
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _notificationController.text = "${picked.hour}:${picked.minute}";
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }
}
