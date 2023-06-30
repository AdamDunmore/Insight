import 'package:flutter/cupertino.dart';
import 'package:insight/data/hive_database.dart';
import 'notes.dart';

class NoteData extends ChangeNotifier {

  final db = HiveDatabase();

  List<Note> allNotes = [
  ];

  void initializeNotes(){
    allNotes = db.loadNotes();
  }

  List<Note> getAllNotes(){
    return allNotes;
  }
  
  void addNote(Note note){
    allNotes.add(note);
    notifyListeners();
  }

  void updateNote(Note note, String text){
    for(int i = 0; i < allNotes.length; i++){
      if(allNotes[i].id == note.id){
        allNotes[i].text = text;
      }
    }
    HiveDatabase().savedNotes(allNotes);
  }

  void deleteNote(Note note){
    allNotes.remove(note);
    notifyListeners();
    HiveDatabase().savedNotes(allNotes);
  }
  
  
}
