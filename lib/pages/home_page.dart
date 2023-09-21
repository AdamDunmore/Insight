import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/hive_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
      ),
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 0)),
          Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black)
            ),
            child: TextButton(
                onPressed: () => {Navigator.pushNamed(context, '/notes'), HiveDatabase().loadNotes()},
                child: const Text("Notes", style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),)
            )
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black)
              ),
              child: TextButton(
                  onPressed: () => {Navigator.pushNamed(context, '/reminders'), HiveDatabase().loadNotes()},
                  child: Text("Reminders", style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),)
              )
          )
        ],
      )
    );
  }

}