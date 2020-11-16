import 'package:DigitalCollectionApp/models/Schema.dart';
import 'package:DigitalCollectionApp/models/fields/Fields.dart' as f;
import 'package:DigitalCollectionApp/widgets/common/field_input_lines/DateInputLine.dart';
import 'package:DigitalCollectionApp/widgets/common/field_input_lines/TextInputLine.dart';
import 'package:flutter/material.dart';

class FieldEditFormBuilder {

  static List<Widget> buildFieldEditorFormWidgets(Schema schema) {

    return schema.getEntries().map((SchemaEntry entry) {
      return _fieldToInputWidget(entry);
    }).toList();
  }

  static Widget _fieldToInputWidget(SchemaEntry entry) {

    switch (entry.type) {
      case f.FieldType.TextField:
        return TextInputLine(entry);
      case f.FieldType.DateField:
        return DateInputLine(entry);
      case f.FieldType.TextField:
        return Text("Not Implemented");
      case f.FieldType.TextField:
        return Text("Not Implemented");
      default:
        throw UnimplementedError("Field type not implemented in the field edit form builder.");
    }
  }
}