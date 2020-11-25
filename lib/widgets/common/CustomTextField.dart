import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {

  final String hint;
  final Function (String) onChanged;
  final TextInputType keyboard;
  final AutovalidateMode autovalidateMode;
  final Function (String) validator;

  CustomTextField({
    this.hint = "",
    this.onChanged,
    this.keyboard = TextInputType.text,
    this.autovalidateMode = AutovalidateMode.always,
    this.validator
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
          child: TextFormField(
            keyboardType: this.widget.keyboard,
            autovalidateMode: this.widget.autovalidateMode,
            validator: this.widget.validator,
            onChanged: this.widget.onChanged,
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
