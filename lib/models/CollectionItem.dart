import 'package:DigitalCollectionApp/models/fields/field_model.dart' as f;
import 'package:DigitalCollectionApp/models/Schema.dart';
import 'dart:convert';

/// CollectionItem.dart
///
/// To be implemented.

class CollectionItem {

  Map<String, f.Field> fields;
  Schema schema;

  CollectionItem(this.schema) {
    fields = new Map<String, f.Field>();
  }

  void load(String jsonItem) {
    Map<String, dynamic> jsonMap = jsonDecode(jsonItem);
    for (var key in jsonMap.keys) {
      // Get the type of the field
      f.FieldType type = schema.getEntryType(key);

      if (type != null) {
        // Add a field of the appropriate type to the Collection Item
        f.Field field = f.FieldUtil.load(type, key, jsonMap[key]);
        fields[key] = field;
      }
      else {
        throw Exception("Failed to parse type of field: $key");
      }
    }
  }

  String serialize() {
    Map<String, dynamic> jsonMap = new Map();
    for (var key in fields.keys) {
      jsonMap[key] = f.FieldUtil.getValue(fields[key]);
    }
    return jsonEncode(jsonMap);
  }

  f.Field getField(String name) {
    if (schema.getEntryNames().contains(name)) {
      return fields[name];
    }
    else {
      throw Exception("Field not in schema.");
    }
  }

  void addField(f.Field field) {
    fields[field.name] = field;
  }

  void removeField(String name) {
    if (schema.getEntryNames().contains(name)) {
      fields.remove(name);
    }
    else {
      throw Exception("Field not in schema");
    }
  }

  void updateField(String name, dynamic newValue) {
    if (schema.getEntryNames().contains(name)) {
      f.FieldUtil.setValue(fields[name], newValue);
    }
    else {
      throw Exception("Field not in schema");
    }
  }

  List<String> getFieldNames() {
    return schema.getEntryNames();
  }
}