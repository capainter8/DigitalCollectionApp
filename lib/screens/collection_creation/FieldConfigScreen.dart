import 'package:DigitalCollectionApp/models/fields/field_model.dart';
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
      body: _getConfigurationForm(type),
    );
  }

  Widget _getConfigurationForm(FieldType type) {
    switch (type) {
      case FieldType.TextField:
        return TextFieldConfigWidget();
      case FieldType.DecimalField:
        return DecimalFieldConfigWidget();
      default:
        throw UnimplementedError("Configuration form not implemented for given field type");
    }
  }
}
