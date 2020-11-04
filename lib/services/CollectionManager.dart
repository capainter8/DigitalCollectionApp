import 'package:DigitalCollectionApp/services/LocalDatabase.dart';
import 'package:flutter/cupertino.dart';
import '../models/Collection.dart';
import '../models/CollectionItem.dart';
import 'dart:async';

/// CollectionManager.dart
///
/// The purpose of this class is to abstract the database operations needed
/// by the application from its implementation. Using this method, modules of
/// the application that use the database don't need to worry about whether
/// the data is stored locally or in the cloud.

class CollectionManager extends ChangeNotifier {

  static final instance = CollectionManager._();
  static List<Collection> _collections;

  CollectionManager._() {
    _collections = new List<Collection>();
  }

  /// Updates the collection managers internal collection list with the local
  /// database.
  Future<void> update() async {
    List<Collection> temp = await LocalDatabase.instance.getAllCollections();
    temp.forEach((collection) {
      if (!_collections.contains(collection)) {
        _collections.add(collection);
      }
    });
    notifyListeners();
  }

  /// Returns a list of all collections managed by the collection manager
  Future<List<Collection>> getAllCollections() async {
    return _collections;
  }

  void addCollectionItem(Collection collection, CollectionItem collectionItem) {
    collection.add(collectionItem);
  }

  void addCollection(Collection collection) {
    LocalDatabase.instance.insertCollection(collection);
    _collections.add(collection);
    // Notify the collection management page that there is a new collection
    // in the manager so it can update its list.
    notifyListeners();
  }

  Collection getCollection(String name) {
    return _collections.firstWhere((element) => element.name == name);
  }
}