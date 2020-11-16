import 'package:DigitalCollectionApp/widgets/common/Label.dart';
import 'package:DigitalCollectionApp/widgets/common/StyledTextField.dart';
import 'package:flutter/material.dart';

class LabeledTextField extends StatelessWidget {

  String label;
  String hint;
  Function(String) onChanged;
  LabeledTextField({@required this.label, this.hint, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StringLabel(this.label),
        StyledTextField(hint: this.hint, onChanged: this.onChanged,),
      ],
    );
  }
}
