import 'package:DigitalCollectionApp/models/fields/Fields.dart';
import 'package:DigitalCollectionApp/models/Schema.dart';
import 'dart:convert';

/// CollectionItem.dart
///
/// To be implemented.

class CollectionItem {

  Map<String, Field> fields;
  Schema schema;

  CollectionItem(this.schema) {
    fields = new Map<String, Field>();
  }

  void load(String jsonItem) {
    Map<String, dynamic> jsonMap = jsonDecode(jsonItem);
    for (var key in jsonMap.keys) {
      // Get the type of the field
      FieldType type = schema.getEntryType(key);
      if (type != null) {
        Field field = loadField(type, key, jsonMap[key]);
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
      jsonMap[key] = fields[key].serialize();
    }
    return jsonEncode(jsonMap);
  }

  Field getField(String name) {
    if (schema.getEntryNames().contains(name)) {
      return fields[name];
    }
    else {
      throw Exception("Field not in schema.");
    }
  }

  void addField(Field field) {
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
      fields[name].value(newValue);
    }
    else {
      throw Exception("Field not in schema");
    }
  }

  List<String> getFieldNames() {
    return schema.getEntryNames();
  }

  compareTo(CollectionItem other, Field toCompare) {
    if (toCompare is ComparableField) {
      ComparableField fieldA = this.getField(toCompare.name) as ComparableField;
      Field fieldB = other.getField(toCompare.name);
      return fieldA.compareTo(fieldB);
    } else {
      throw Exception("Tried to compare a collection item using a non-comparable field");
    }
  }

  String searchBlob() {
    return fields.values.map((field) {
      return field.serialize().toString();
    }).reduce((s1, s2) {
      return s1 + s2;
    });
  }
}