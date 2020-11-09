import 'package:DigitalCollectionApp/models/Schema.dart';
import 'dart:convert';

/// Collection.dart
///
///

import "CollectionItem.dart";
import "package:flutter/widgets.dart";

class Collection {

  int id;
  String name;
  String description;
  DateTime creationDate;
  List<CollectionItem> items;
  Schema schema;

  /// Default construction is not allowed for this class
  Collection._();

  Collection.buildNew({
    @required this.name,
    @required this.description,
    @required this.schema }) {

    id = DateTime.now().millisecondsSinceEpoch;
    creationDate = DateTime.now();
    items = List<CollectionItem>();
  }

  Collection.fromExisting({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.creationDate,
    @required String itemsJson,
    @required this.schema}) {

    loadItems(itemsJson);
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

  List<CollectionItem> deserializeItems(String json, Schema schema) {
    var map = jsonDecode(json);
    var list = map['items'] as List<dynamic>;

    return list.map((itemJson) {
      CollectionItem item = CollectionItem(schema);
      item.load(itemJson);
      return item;
    }).toList();
  }

  void loadItems(String json) {
    this.items = deserializeItems(json, this.schema);
  }
}