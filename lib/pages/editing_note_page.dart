import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:provider/provider.dart';

import '../models/notes.dart';
import '../models/notes_data.dart' as notedata;

class EditingNotePage extends StatefulWidget {
  Note note;
  bool isNewNote;


  EditingNotePage({
    super.key,
    required this.note,
    required this.isNewNote,
  });

  @override
  State<EditingNotePage> createState() => _EditingNotePagesState();
}

class _EditingNotePagesState extends State<EditingNotePage> {

  quill.QuillController _controller = quill.QuillController.basic();

  void loadNote() {
    final doc = quill.Document()..insert(0, widget.note.text);
    setState(() {
      _controller = quill.QuillController(document: doc, selection: const TextSelection.collapsed(offset: 0));
    });

    _controller.document.changes.listen((event){
      updateNote();
    });
  }

  void updateNote(){
    String text = _controller.document.toPlainText();
    Provider.of<notedata.NoteData>(context, listen: false).updateNote(widget.note, text); // IMPORTANT AND CAUSING ERROR because its removing note
  }



  @override
  Widget build(BuildContext context) {
    loadNote();
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 85,
            color: Colors.grey,
            child: Row(
              children: [
                Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => {
                      Navigator.pop(context),
                    }),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                        child: Text(
                          widget.note.title,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        )
                    )
                )
              ],
            )
          ),
          Expanded(
            child: Container(
              child: quill.QuillEditor.basic(controller: _controller, readOnly: false),
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0)
            )
          ),
        ],
      ),
    );
  }
}