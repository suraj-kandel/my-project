import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  String label;
  Function toDo;

  Calculate({this.label, this.toDo});

  @override
  _CalculateState createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 353,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color.fromRGBO(66, 103, 178, 1),
          ),
          elevation: MaterialStateProperty.all(3),
        ),
        onPressed: widget.toDo,
        child: Text(
          widget.label,
          style: TextStyle(
              fontSize: 30, fontFamily: 'Roboto', fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
