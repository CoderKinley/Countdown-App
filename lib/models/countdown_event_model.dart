class CountdownEventModel {
  String id;
  String title;
  String description;
  DateTime startDate;
  DateTime endDate;
  String imageUrl;
  List<String> notificationReminder;
  String eventRepeat;
  DateTime notificationTime;

  CountdownEventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.imageUrl,
    required this.notificationReminder,
    required this.eventRepeat,
    required this.notificationTime,
  });

  factory CountdownEventModel.fromJson(Map<String, dynamic> json) {
    return CountdownEventModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      notificationTime: DateTime.parse(json['notificationTime']),
      imageUrl: json['imageUrl'] as String,
      notificationReminder: List<String>.from(json['notificationReminder']),
      eventRepeat: json['eventRepeat'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'notificationTime': notificationTime.toIso8601String(),
      'id': id,
      'title': title,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'imageUrl': imageUrl,
      'notificationReminder': notificationReminder,
      'eventRepeat': eventRepeat,
    };
  }

  CountdownEventModel copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    String? imageUrl,
    DateTime? notificationTime,
    List<String>? notificationReminder,
    String? eventRepeat,
  }) {
    return CountdownEventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      notificationTime: notificationTime ?? this.notificationTime,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      imageUrl: imageUrl ?? this.imageUrl,
      notificationReminder: notificationReminder ?? this.notificationReminder,
      eventRepeat: eventRepeat ?? this.eventRepeat,
    );
  }
}
