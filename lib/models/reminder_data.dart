import 'package:flutter/cupertino.dart';
import '../data/reminder_database.dart';
import 'reminder.dart';

class ReminderData extends ChangeNotifier {
  final db = ReminderDatabase();
  List<Reminder> allReminders = [];

  List<Reminder> getAllReminders(){
    return allReminders;
  }

  void initializeReminders(){
    allReminders = db.loadReminders();
  }

  void addReminder(Reminder reminder){
    allReminders.add(reminder);
    notifyListeners();
  }

  void deleteReminder(Reminder reminder){
    allReminders.remove(reminder);
    notifyListeners();
    ReminderDatabase().savedReminders(allReminders);
  }
}