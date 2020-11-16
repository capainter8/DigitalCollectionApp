import 'package:flutter/material.dart';

class StyledTextField extends StatefulWidget {
  final String hint;
  var onChanged;
  StyledTextField({this.hint, this.onChanged});

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
              hintText: this.widget.hint,
            ),
            onChanged: (value) {
              this.widget.onChanged(value);
            }
          ),
        ),
      ],
    );
  }
}
