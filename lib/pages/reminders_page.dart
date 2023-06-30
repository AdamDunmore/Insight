import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemindersPage extends StatefulWidget {
  const RemindersPage({super.key});

  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Align(child: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back)), alignment: Alignment.topLeft,),
          ]
      ),
    );
  }

}