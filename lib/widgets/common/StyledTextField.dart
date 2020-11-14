import 'package:flutter/material.dart';

class StyledTextField extends StatefulWidget {

  String hint;
  StyledTextField({this.hint});

  @override
  _StyledTextFieldState createState() => _StyledTextFieldState();
}

class _StyledTextFieldState extends State<StyledTextField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: this.widget.hint
            )
          ),
        )
      ]
    );
  }
}
