import 'package:DigitalCollectionApp/models/Schema.dart';

/// Collection.dart
///
///

import "CollectionItem.dart";
import "package:flutter/widgets.dart";

class Collection {

  UniqueKey id; // Uniquely identifies this collection
  String name;
  String description;
  DateTime creationDate;
  List<CollectionItem> items;
  Schema schema;

  Collection (
      this.name,
      this.description,
      this.creationDate,
      this.schema
      )
  {
    this.items = new List<CollectionItem>();
    this.id = UniqueKey();
  }

  void add(CollectionItem item) {
    items.add(item);
  }
}