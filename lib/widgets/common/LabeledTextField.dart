import 'package:DigitalCollectionApp/widgets/common/Label.dart';
import 'package:DigitalCollectionApp/widgets/common/StyledTextField.dart';
import 'package:flutter/material.dart';

class LabeledTextField extends StatefulWidget {

  String label;
  String hint;
  LabeledTextField({@required this.label, this.hint});

  @override
  _LabeledTextFieldState createState() => _LabeledTextFieldState();
}

class _LabeledTextFieldState extends State<LabeledTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StringLabel(this.widget.label),
        StyledTextField(hint: this.widget.hint),
      ],
    );
  }
}
