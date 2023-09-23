import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/notes.dart';

class NoteDatabase {
  final _myBox = Hive.box('note_database');

  List<Note> loadNotes() {
    List<Note> savedNotesFormatted = [];
    if(_myBox.get("ALL_NOTES") != null){
      List<dynamic> savedNotes = _myBox.get("ALL_NOTES");
      for (int i = 0; i < savedNotes.length; i++){
        Note individualNote = Note(id: savedNotes[i][0], title: savedNotes[i][1], text: savedNotes[i][2]);
        savedNotesFormatted.add(individualNote);
      }
    }

    return savedNotesFormatted;
  }

  void savedNotes(List<Note> allNotes){
    List<List<dynamic>> allNotesFormatted = [];
      for (var note in allNotes) {
        int id = note.id;
        String title = note.title;
        String text = note.text;
        allNotesFormatted.add([id,title,text]);
      }
      _myBox.put("ALL_NOTES", allNotesFormatted);
  }
}