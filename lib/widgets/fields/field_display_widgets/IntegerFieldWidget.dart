import 'package:flutter/material.dart';
import 'BaseFieldWidget.dart';
import 'package:DigitalCollectionApp/models/fields/Fields.dart' as fields;

class IntegerFieldWidget extends StatelessWidget {

  final fields.IntegerField field;

  const IntegerFieldWidget(this.field);

  @override
  Widget build(BuildContext context) {

    int value = field.value;
    String formattedValue = value.toString(); // 2 digits for now
    return BaseField(field.name, Text(formattedValue));
  }
}