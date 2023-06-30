import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/hive_database.dart';
import '../pages/notes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Column(
        children: [
          TextButton(
              onPressed: () => {Navigator.pushNamed(context, '/notes'), HiveDatabase().loadNotes()},
              child: Text("Notes")
          )
        ],
      )
    );
  }

}