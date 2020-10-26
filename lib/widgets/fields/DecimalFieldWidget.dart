import 'package:flutter/material.dart';
import 'BaseFieldWidget.dart';
import 'package:DigitalCollectionApp/models/fields/Fields.dart' as fields;

class DecimalFieldWidget extends StatelessWidget {

  final fields.DecimalField field;

  const DecimalFieldWidget(this.field);

  @override
  Widget build(BuildContext context) {

    double value = field.value;
    String formattedValue = value.toStringAsFixed(2); // 2 digits for now

    return BaseField(field.name, Text(formattedValue));
  }
}