/// Collection.dart
///
///

import "CollectionItem.dart";
import "package:flutter/widgets.dart";

class Collection {

  UniqueKey _id; // Uniquely identifies this collection
  String _name;
  String _description;
  DateTime _creationDate;
  List<CollectionItem> _items;

  Collection (
      UniqueKey id,
      String name,
      String description,
      DateTime creationDate,
      ) {
    _id = id;
    _name = name;
    _description = description;
    _creationDate = creationDate;
  }

  UniqueKey getId() {
    return _id;
  }

  String getName() {
    return _name;
  }

  String getDescription() {
    return _description;
  }

  DateTime getCreationDate() {
    return _creationDate;
  }

  int getItemCount() {
    return _items.length;
  }

  void addItem(CollectionItem item) {
    _items.add(item);
  }
}