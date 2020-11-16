import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {

  final String hint;
  final Function (String) onChanged;

  CustomTextField({
    this.hint = "",
    this.onChanged
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: this.widget.onChanged,
            maxLength: 255,
            maxLengthEnforced: true,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0)
              )
            ),
          )
        )
      ],
    );
  }
}
