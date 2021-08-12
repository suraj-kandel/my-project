import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Field extends StatefulWidget {
  String label;
  List<String> type;

  Field({this.label, this.type});

  get valueChoose {
    return valueChoose;
  }

  @override
  _FieldState createState() => _FieldState();
}

class _FieldState extends State<Field> {
  String gender;

  String valueChoose;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 8,
          child: TextFormField(
            onSaved: (value) {
              value = gender;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: widget.label,
              hintText: widget.label,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black,
                  )),
            ),
          ),
        ),
        SizedBox(
          width: 60,
        ),
        Flexible(
          flex: 3,
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonFormField(
              onSaved: (value) {
                valueChoose = value;
              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              value: valueChoose,
              isExpanded: true,
              onChanged: (newValue) {
                valueChoose = newValue;
              },
              items: widget.type.map<DropdownMenuItem>((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
