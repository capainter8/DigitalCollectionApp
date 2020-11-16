import 'package:DigitalCollectionApp/models/Schema.dart';
import 'package:DigitalCollectionApp/services/CollectionManager.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import "CollectionItem.dart";

class Collection extends ChangeNotifier {

  int id;
  String name;
  String description;
  DateTime creationDate;
  List<CollectionItem> items;
  Schema schema;

  /// Default construction is not allowed for this class
  Collection._();

  Collection.buildNew({
    this.name,
    this.description,
    this.schema }) {

    id = DateTime.now().millisecondsSinceEpoch;
    creationDate = DateTime.now();
    items = List<CollectionItem>();
  }

  Collection.fromExisting({
    this.id,
    this.name,
    this.description,
    this.creationDate,
    String itemsJson,
    this.schema}) {

    loadItems(itemsJson);
  }

  void add(CollectionItem item) {
    items.add(item);
    CollectionManager.instance.updateCollection(this);
    notifyListeners();
  }

  void removeItem(CollectionItem item) {
    items.remove(item);
    CollectionManager.instance.updateCollection(this);
    notifyListeners();
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