import 'package:DigitalCollectionApp/models/Schema.dart';
import 'dart:convert';

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

  String serializeItems() {
    List<String> serializedItems = items.map((e) => e.serialize()).toList();
    return jsonEncode(
      {
        'items': serializedItems
      }
    );
  }

  void loadItems(String json) {

    var map = jsonDecode(json);
    var list = map['items'] as List<dynamic>;

    items.addAll(
      list.map((elem) {
        CollectionItem item = CollectionItem(schema);
        item.load(elem);
        return item;
      })
    );
  }
}