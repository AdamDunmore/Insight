import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insight/models/reminder.dart';
import 'package:insight/models/reminder_data.dart';
import 'package:provider/provider.dart';

class RemindersPage extends StatefulWidget {
  const RemindersPage({super.key});

  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  @override

  Widget build(BuildContext context) {
    return Consumer<ReminderData>(builder: (context, value, child) => Scaffold(
      body: Column(
          children: [
            Align(child: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back)), alignment: Alignment.topLeft,),
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
                        //onTap: () => goToNote(value.getAllNotes()[index]),
                        //trailing: IconButton(icon: const Icon(Icons.delete, color: Colors.white), onPressed: () => value.deleteNote(value.getAllNotes()[index])),
                      )
                  );
                },
              ),
            ),
            FloatingActionButton(onPressed: ()=> value.addReminder(Reminder(id: 0, description: "A New reimnder", eventDate: DateTime.parse("2023-06-31 08:00"))))
          ]
      ),
    ),);
  }

}