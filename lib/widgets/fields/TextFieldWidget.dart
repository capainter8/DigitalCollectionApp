import 'package:flutter/material.dart';

import 'package:DigitalCollectionApp/models/fields/Fields.dart' as fields;
import 'BaseFieldWidget.dart';

class TextFieldWidget extends StatelessWidget {

  final fields.TextField _field;

  TextFieldWidget(this._field);

  @override
  Widget build(BuildContext context) {
    // TODO: Create a better field
    return BaseField(
      _field.name,
      Text(_field.value)
    );
  }
}