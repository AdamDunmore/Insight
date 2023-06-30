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
            height: 40,
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => {
                  Navigator.pop(context),
                  updateNote()
                }),
          )),
          Expanded(
            child: Container(
              child: quill.QuillEditor.basic(controller: _controller, readOnly: false),
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          )),
          Container(
            padding: const EdgeInsets.fromLTRB(0,20,0,0),
            child: Center(child: quill.QuillToolbar.basic(controller: _controller, showAlignmentButtons: false, showBackgroundColorButton: false, showCenterAlignment: false, showColorButton: false, showClearFormat: false, showCodeBlock: false, showFontFamily: false, showFontSize: false, showHeaderStyle: false, showDirection: false, showDividers: false, showIndent: false, showInlineCode: false, showJustifyAlignment: false, showLeftAlignment: false, showLink: false, showQuote: false, showListNumbers: false, showRightAlignment: false, showStrikeThrough: false,))
          )

        ],
      ),
    );
  }
}