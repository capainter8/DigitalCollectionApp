import 'dart:collection';

import 'package:DigitalCollectionApp/services/CollectionManager.dart';
import 'package:flutter/material.dart';
import 'Collection.dart';
import 'Schema.dart';
import 'fields/field_model.dart' as f;

class CreateCollectionModel extends ChangeNotifier {

  List<SchemaEntry> fields;

  // The current field that is selected in the data table
  SchemaEntry _selectedField;

  String collectionName;
  String collectionDescription;

  CreateCollectionModel() {
    fields = List<SchemaEntry>();
    fields.addAll([
      SchemaEntry('Text Field 1', f.FieldType.TextField, required: true),
      SchemaEntry('Text Field 2', f.FieldType.TextField),
      SchemaEntry('Decimal Field 1', f.FieldType.DecimalField, required: true),
      SchemaEntry('Decimal Field 2', f.FieldType.DecimalField)
    ]);
    _selectedField = null;
  }

  /// Add the collection to the collection manager
  void commitCollection() async {

    // Create the schema
    Schema schema = Schema.fromList(entries: fields);

    // Create the collection
    int nCollections = (await CollectionManager.instance.getAllCollections()).length;
    Collection collection = Collection.buildNew(
        name: 'New Collection  ' + nCollections.toString(),
        description: 'No Description',
        schema: schema);

    // Add the schema to the collection
    collection.schema = schema;
    // Add the collection to the collection manager
    CollectionManager.instance.addCollection(collection);
  }

  UnmodifiableListView<SchemaEntry> getFields() {
    return UnmodifiableListView(fields);
  }

  void addField(SchemaEntry field) {
    fields.add(field);
    notifyListeners();
  }

  void removeField(SchemaEntry field) {
    int index = fields.indexOf(_selectedField);

    int next; // The index of the next field that will be selected
    if (index - 1 <= 0) {
      next = (index + 1) % fields.length;
    } else {
      next = (index - 1) % fields.length;
    }

    SchemaEntry temp = fields.elementAt(next);
    fields.remove(_selectedField);

    if (fields.length > 0) {
      _selectedField = temp;
    } else {
      _selectedField = null;
    }
    
    notifyListeners();
  }

  void moveSelectedFieldUp() {
    // can the field go up?
    int pos = fields.indexOf(_selectedField);
    if (pos < 1) { // the selected field is a the top already
      return; // Do nothing
    }

    SchemaEntry tmp = fields[pos];
    fields[pos] = fields[pos-1];
    fields[pos-1] = tmp;

    notifyListeners();
  }

  void moveSelectedFieldDown() {
    // Can the field go down?
    int pos = fields.indexOf(_selectedField);
    if (pos > fields.length - 2 || pos < 0) { // The selected field is at the bottom
      return; // Do nothing
    }

    SchemaEntry tmp = fields[pos];
    fields[pos] = fields[pos+1];
    fields[pos+1] = tmp;

    notifyListeners();
  }

  set selectedField(SchemaEntry field) {
    _selectedField = field;
    notifyListeners();
  }

  SchemaEntry get selectedField {
    return _selectedField;
  }
}