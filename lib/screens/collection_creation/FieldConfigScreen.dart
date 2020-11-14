import 'package:DigitalCollectionApp/models/fields/Fields.dart';
import 'package:DigitalCollectionApp/widgets/fields/field_configuration_forms/DateFieldConfigWidget.dart';
import 'package:DigitalCollectionApp/widgets/fields/field_configuration_forms/DecimalFieldConfigWidget.dart';
import 'package:DigitalCollectionApp/widgets/fields/field_configuration_forms/TextFieldConfigWidget.dart';
import 'package:flutter/material.dart';

class FieldConfigScreen extends StatelessWidget {

  FieldConfigScreen();

  @override
  Widget build(BuildContext context) {

    final FieldType type = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Configure Field"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: _getConfigurationForm(type),
      ),
    );
  }

  Widget _getConfigurationForm(FieldType type) {
    switch (type) {
      case FieldType.TextField:
        return TextFieldConfigWidget();
      case FieldType.DecimalField:
        return DecimalFieldConfigWidget();
      case FieldType.DateField:
        return DateFieldConfigWidget();
      default:
        throw UnimplementedError("Configuration form not implemented for given field type");
    }
  }
}
