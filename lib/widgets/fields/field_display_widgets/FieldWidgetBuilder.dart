import 'package:DigitalCollectionApp/models/Schema.dart';
import 'package:DigitalCollectionApp/widgets/fields/field_display_widgets/DateFieldWidget.dart';
/// FieldWidgetBuilder.dart
///
/// Use this class to construct a widget for a specific field type.

import 'package:flutter/material.dart';
import '../../../models/fields/Fields.dart' as f;
import 'DecimalFieldWidget.dart';
import 'IntegerFieldWidget.dart';
import 'TextFieldWidget.dart';

class FieldWidgetBuilder {
  static Widget build(f.Field field, bool required) {
    if (field.value == null) {
      if (required) {
        throw("Required field was null in FieldWidgetBuilder");
      } else {
        return Container();
      }
    }

    if (field is f.TextField) {
      return TextFieldWidget(field);
    }
    else if (field is f.DecimalField) {
      return DecimalFieldWidget(field);
    }
    else if (field is f.DateField) {
      return DateFieldWidget(field);
    }
    else if (field is f.IntegerField) {
      return IntegerFieldWidget(field);
    }
    else {
      throw("An unimplemented field type was passed to the field widget builder.");
    }
  }
}