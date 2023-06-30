import 'package:flutter/material.dart';
import 'package:insight/models/notes.dart';
import 'package:insight/models/notes_data.dart';
import 'package:insight/pages/editing_note_page.dart';
import 'package:provider/provider.dart';

import '../data/hive_database.dart';
import '../models/notes_data.dart' as notedata;

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  void initState(){
    super.initState();
    Provider.of<NoteData>(context, listen: false).initializeNotes();
  }

  void goToNote(Note note){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditingNotePage(note: note, isNewNote: false))
    );
  }


  String noteTitle = "";

  Widget build(BuildContext context) {
      return Consumer<NoteData>(builder: (context, value, child) => Scaffold(
        body: Column(
            children: [
              Align(child: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back)), alignment: Alignment.topLeft,),
              const Padding(
                  padding: EdgeInsets.fromLTRB(0,10,0,10),
                  child: Text(
                  'Notes',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.getAllNotes().length,
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
                          title: Text(value.getAllNotes()[index].title, style: const TextStyle(color: Colors.white, fontSize: 20)),
                          onTap: () => goToNote(value.getAllNotes()[index]),
                          trailing: IconButton(icon: const Icon(Icons.delete, color: Colors.white), onPressed: () => value.deleteNote(value.getAllNotes()[index])),
                        )
                    );
                  },
                ),
              ),
            ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Text("+", style: TextStyle(fontSize: 30)),
          onPressed: () =>  {
            showDialog(context: context, builder: (context) => AlertDialog(
              title: const Text("Create Note"),
              content: TextField(
                decoration: const InputDecoration(
                  hintText: "Title"
                ),
                onChanged: (text){
                  noteTitle = text;
                },
              ),
              actions: [
                TextButton(onPressed: () => {value.addNote(Note(id: value.allNotes.length,title: noteTitle, text: "")), Navigator.pop(context), noteTitle = "", HiveDatabase().savedNotes(value.allNotes)}, child: const Text("Submit"))
              ],
            )
          ),

          },
        ),
      ),
      );
  }
}
