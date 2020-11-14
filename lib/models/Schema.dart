/// Schema.dart
///
/// A schema represents all of the fields in a collection.

import 'fields/Fields.dart';
import 'dart:convert';

class SchemaEntry {
  String name;
  FieldType type;
  bool required;
  SchemaEntry(this.name, this.type, {this.required=false});
}

class Schema {

  List<SchemaEntry> _entries;

  Schema.fromList({
    List<SchemaEntry> entries}) {

    _entries = List();
    _entries.addAll(entries);
  }

  Schema.fromJson({
    String json }) {

    _entries = deserialize(json);
  }

  String serialize() {

    List<Map<String, String>> entries = _entries.map(
        (entry) {
          return {
            'name': entry.name,
            'type': entry.type.toString(),
            'required': entry.required.toString()
          };
        }
    ).toList();
    Map<String, List<Map<String, String>>> container = {
      'entries': entries
    };
    return jsonEncode(container);
  }

  deserialize(String json) {

    Map<String, dynamic> map = jsonDecode(json);
    List<dynamic> entries = map['entries'];

    return entries.map(
        (entry) {
          return SchemaEntry(
            entry['name'],
            _getFieldType(entry['type']),
            required: entry['required'] == 'true'
          );
        }
    ).toList();
  }

  List<String> getEntryNames() {
    return _entries.map((e) => e.name).toList();
  }

  // Get the type of an entry
  FieldType getEntryType(String name) {
      return _entries.firstWhere(
          (entry) => entry.name == name,
          orElse: () => SchemaEntry(null, null)
      ).type;
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