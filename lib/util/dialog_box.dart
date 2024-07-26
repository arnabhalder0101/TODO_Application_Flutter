// ignore_for_file: unused_import, must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_app/util/button.dart';
import 'package:todo_app/util/todo_tile.dart';

class DialogBox extends StatefulWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(
          "Add New Task",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        //
        backgroundColor: Colors.yellow[200],

        //

        content: TextField(
          maxLines:
              null, // will expand vertically -- give a nice feel to user to read entire content
          controller: widget.controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            hintText: "Add... ",
          ),
        ),
        actions: [
          // Save --
          TextButton(onPressed: widget.onSave, child: Text("Save")),

          // Cancel --
          TextButton(onPressed: widget.onCancel, child: Text("Cancel")),
        ]

        // content: Container(
        //   height: 140,
        //   child: Column(
        //     children: [
        //       TextField(
        //         maxLines: null, // will expand vertically -- give a nice feel to user to read entire content
        //         controller: widget.controller,
        //         decoration: InputDecoration(
        //           border:
        //               OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        //           hintText: "Add... ",
        //         ),
        //       ),

        //       // Save  --
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           MyButtons(textName: "Save", onPressed: widget.onSave),
        //           // Cancel --
        //           MyButtons(textName: "Cancel", onPressed: widget.onCancel)
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
