import 'package:to_do_list/models/reminder_offset.dart';
import 'package:to_do_list/models/repeat_type.dart';

extension RepeatTypeX on RepeatType {
  String get displayName {
    switch (this) {
      case RepeatType.none:
        return "Don't Repeat";
      case RepeatType.daily:
        return "Daily";
      case RepeatType.weekly:
        return "Weekly";
      case RepeatType.monthly:
        return "Monthly";
      case RepeatType.yearly:
        return "Yearly";
    }
  }
}

extension ReminderOffsetX on ReminderOffset {
  String get displayName {
    switch (this) {
      case ReminderOffset.onEventDay:
        return "On the day";
      case ReminderOffset.oneDayBefore:
        return "1 day before";
      case ReminderOffset.threeDaysBefore:
        return "3 days before";
      case ReminderOffset.sevenDaysBefore:
        return "7 days before";
      case ReminderOffset.fifteenDaysBefore:
        return "15 days before";
      case ReminderOffset.thirtyDaysBefore:
        return "30 days before";
    }
  }

  Duration get duration {
    switch (this) {
      case ReminderOffset.onEventDay:
        return Duration.zero;
      case ReminderOffset.oneDayBefore:
        return const Duration(days: 1);
      case ReminderOffset.threeDaysBefore:
        return const Duration(days: 3);
      case ReminderOffset.sevenDaysBefore:
        return const Duration(days: 7);
      case ReminderOffset.fifteenDaysBefore:
        return const Duration(days: 15);
      case ReminderOffset.thirtyDaysBefore:
        return const Duration(days: 30);
    }
  }
}
