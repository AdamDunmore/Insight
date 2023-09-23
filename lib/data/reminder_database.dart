import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/reminder.dart';

class ReminderDatabase {
  final _myBox = Hive.box('reminder_database');

  List<Reminder> loadReminders() {
    List<Reminder> savedRemindersFormatted = [];
    if(_myBox.get("ALL_REMINDERS") != null){
      List<dynamic> savedReminders = _myBox.get("ALL_REMINDERS");
      for (int i = 0; i < savedReminders.length; i++){
        Reminder individualReminder = Reminder(id: savedReminders[i][0], description: savedReminders[i][1], eventDate: savedReminders[i][2]);
        savedRemindersFormatted.add(individualReminder);
      }
    }

    return savedRemindersFormatted;
  }

  void savedReminders(List<Reminder> allReminders){
    List<List<dynamic>> allRemindersFormatted = [];
    for (var reminder in allReminders) {
      int id = reminder.id;
      String description = reminder.description;
      DateTime eventDate = reminder.eventDate;
      allRemindersFormatted.add([id,description,eventDate]);
    }
    _myBox.put("ALL_REMINDERS", allRemindersFormatted);
  }
}