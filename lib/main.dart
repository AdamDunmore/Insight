import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:insight/models/notes_data.dart';
import 'package:insight/models/reminder_data.dart';
import 'package:insight/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'pages/notes_page.dart';
import 'pages/reminders_page.dart';

void main() async{
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

  await Hive.initFlutter();

  await Hive.openBox('note_database');
  await Hive.openBox('reminder_database');


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<NoteData>(create: (noteContext) => NoteData()),
          ChangeNotifierProvider<ReminderData>(create: (reminderContext) => ReminderData()),
        ],
        child: MaterialApp(
          routes: {
            '/home': (context) => const HomePage(),
            '/notes': (noteContext) => const NotePage(),
            '/reminders' : (reminderContext) => const RemindersPage()
          },
            debugShowCheckedModeBanner: false,
            home: HomePage()
        ),
    );
  }
}

