import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:insight/models/notes_data.dart';
import 'package:insight/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'pages/notes_page.dart';
import 'package:flutter/services.dart';

void main() async{
  await Hive.initFlutter();
  
  await Hive.openBox('note_database');

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => NoteData(),
        builder: (context, child) => MaterialApp(
          routes: {
            '/home': (context) => const HomePage(),
            '/notes': (context) => const NotePage()
          },
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ),
    );
  }
}