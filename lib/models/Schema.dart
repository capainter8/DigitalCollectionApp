/// Schema.dart
///
/// A schema represents all of the fields in a collection.

import 'fields/Fields.dart' as fields;
import 'fields/FieldType.dart';
import 'dart:convert';

/// TODO: implement schema field options.
class Schema {

  Map<String, FieldType> _entries;

  Schema() {
    this._entries = new Map<String, FieldType>();
  }

  // Loads the fields from a json string
  void load(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    for (var key in map.keys) {
      FieldType type = _getFieldType(map[key]);
      _entries[key] = type;
    }
  }

  // Serialize the entries to a json object
  String serialize() {
    Map<String, String> converted = new Map<String, String>();
    for (var key in _entries.keys) {
      converted[key] = _entries[key].toString();
    }
    return jsonEncode(converted);
  }

  // Add a field to the schema
  void addField(fields.Field field) {
    _entries[field.name] = field.getType();
  }

  // Remove a field with a given name from the schema
  void removeField(String name) {
    _entries.remove(name);
  }

  // Get a list of the keys
  List<String> getKeys() {
    return _entries.keys.toList();
  }

  // Get the value of an entry
  FieldType getValue(String name) {
      return _entries[name];
  }

  // Convert string to enum
  FieldType _getFieldType(String fieldType) {
    for (var e in FieldType.values) {
      String enumVal = e.toString();
      if (fieldType == enumVal) {
        return e;
      }
    }
    return null;
  }
}