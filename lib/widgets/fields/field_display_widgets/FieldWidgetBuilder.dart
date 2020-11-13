/// FieldWidgetBuilder.dart
///
/// Use this class to construct a widget for a specific field type.

import 'package:flutter/material.dart';
import '../../../models/fields/Fields.dart' as fields;
import 'DecimalFieldWidget.dart';
import 'TextFieldWidget.dart';

class FieldWidgetBuilder {

  static _Visitor visitor = _Visitor();

  static Widget build(fields.Field field) {
    field.accept(visitor);
    return visitor.widget;
  }
}

class _Visitor implements fields.FieldVisitor {

  Widget widget;

  @override
  void visit(fields.Field field) {
    if (field is fields.TextField) {
      widget = new TextFieldWidget(field);
    }
    else if (field is fields.DecimalField) {
      widget = new DecimalFieldWidget(field);
    }
    else {
      throw("An unimplemented field type was passed to the field widget builder.");
    }
  }
}