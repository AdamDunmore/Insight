import 'package:flutter/cupertino.dart';

import 'reminder.dart';

class ReminderData extends ChangeNotifier {
  List<Reminder> allReminders = [];

  List<Reminder> getAllReminders(){
    return allReminders;
  }

  void addReminder(Reminder reminder){
    allReminders.add(reminder);
    notifyListeners();
  }
}