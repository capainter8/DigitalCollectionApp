import 'dart:collection';

import 'package:DigitalCollectionApp/services/CollectionManager.dart';
import 'package:flutter/material.dart';
import 'Collection.dart';
import 'Schema.dart';
import 'fields/field_model.dart' as f;

class CreateCollectionModel extends ChangeNotifier {

  /// The collection that will be added to the collection manager when the
  /// collection creation process is done.
  Collection newCollection;

  /// The schema that will be added to the collection once the  user has
  /// finished creating all the necessary fields.
  Schema newSchema;

  /// The list of fields the user is creates during schema creation
  List<f.Field> newFields;

  // The current field that is selected in the data table
  f.Field _selectedField;

  String collectionName;
  String collectionDescription;

  CreateCollectionModel() {
    newCollection = Collection();
    newSchema = Schema();
    newFields = List<f.Field>();
    newFields.addAll([
      f.FieldUtil.load(f.FieldType.TextField, 'Test Field 1', 'asdf', required: true),
      f.FieldUtil.load(f.FieldType.TextField, 'Test Field 2', 'asdf', required: false),
      f.FieldUtil.load(f.FieldType.DecimalField, 'Test Field 3', 100.0),
    ]);
    _selectedField = null;
  }

  /// Add the collection to the collection manager
  void commitCollection() {
    CollectionManager.instance.addCollection(newCollection);
  }

  UnmodifiableListView<f.Field> getFields() {
    return UnmodifiableListView(newFields);
  }

  void addField(f.Field field) {
    newFields.add(field);
    notifyListeners();
  }

  void removeField(f.Field field) {
    int index = newFields.indexOf(_selectedField);

    int next; // The index of the next field that will be selected
    if (index - 1 <= 0) {
      next = (index + 1) % newFields.length;
    } else {
      next = (index - 1) % newFields.length;
    }

    f.Field temp = newFields.elementAt(next);
    newFields.remove(_selectedField);

    if (newFields.length > 0) {
      _selectedField = temp;
    } else {
      _selectedField = null;
    }
    
    notifyListeners();
  }

  void moveSelectedFieldUp() {
    // can the field go up?
    int pos = newFields.indexOf(_selectedField);
    if (pos < 1) { // the selected field is a the top already
      return; // Do nothing
    }

    f.Field tmp = newFields[pos];
    newFields[pos] = newFields[pos-1];
    newFields[pos-1] = tmp;

    notifyListeners();
  }

  void moveSelectedFieldDown() {
    // Can the field go down?
    int pos = newFields.indexOf(_selectedField);
    if (pos > newFields.length - 2 || pos < 0) { // The selected field is at the bottom
      return; // Do nothing
    }

    f.Field tmp = newFields[pos];
    newFields[pos] = newFields[pos+1];
    newFields[pos+1] = tmp;

    notifyListeners();
  }

  set selectedField(f.Field field) {
    _selectedField = field;
    notifyListeners();
  }

  f.Field get selectedField {
    return _selectedField;
  }
}