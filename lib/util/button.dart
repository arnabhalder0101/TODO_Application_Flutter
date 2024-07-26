import 'package:flutter/material.dart';

class MyButtons extends StatefulWidget {
  String textName;
  VoidCallback onPressed;

  MyButtons({
    super.key,
    required this.textName,
    required this.onPressed,
  });

  @override
  State<MyButtons> createState() => _MyButtonsState();
}

class _MyButtonsState extends State<MyButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10, left: 10, top: 10),
      child: MaterialButton(
        // color: Theme.of(context).primaryColor,
        color: Colors.yellow[600],
        onPressed: widget.onPressed,
        child: Text(widget.textName),
      ),
    );
  }
}
