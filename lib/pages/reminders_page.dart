import 'package:flutter/material.dart';
import 'package:insight/models/reminder.dart';
import 'package:insight/models/reminder_data.dart';
import 'package:provider/provider.dart';

import 'editing_reminder_page.dart';

class RemindersPage extends StatefulWidget {
  const RemindersPage({super.key});

  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  @override
  void initState(){
    super.initState();
    Provider.of<ReminderData>(context, listen: false).initializeReminders();
  }

  void goToReminder(Reminder reminder){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EditingReminderPage())
    );
  }

  Widget build(BuildContext context) {
    return Consumer<ReminderData>(builder: (context, value, child) => Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white
        ),
          child: Column(
          children: [
              Container(
                  width: double.infinity,
                  color: Colors.grey,
                  height: 85,
                        child: Row(
                          children: [
                            Align(alignment: Alignment.bottomLeft,child: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back))),
                            const Align(alignment: Alignment.bottomCenter, child: Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 15), child: Text("Reminders", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))))
                          ],
                  )
              ),
            Text("Coming Soon", style: TextStyle(fontSize: 40),),//Remove When Adding Reminders
            Expanded(
              child: ListView.builder(
                itemCount: value.getAllReminders().length,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(10)
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                      height: 70,
                      width: double.infinity,
                      child: ListTile(
                        title: Text(value.getAllReminders()[index].description, style: const TextStyle(color: Colors.white, fontSize: 20)),
                        onTap: () => goToReminder(value.getAllReminders()[index]),
                        trailing: IconButton(icon: const Icon(Icons.delete, color: Colors.white), onPressed: () => value.deleteReminder(value.getAllReminders()[index])),
                      )
                  );
                },
              ),
            ),
          ]
        )
      )
    ));
  }

}