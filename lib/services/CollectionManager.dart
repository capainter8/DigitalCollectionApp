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
  Future<void> pull() async {
    _collections.clear();
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

  void addCollection(Collection collection) async {
    await LocalDatabase.instance.insertCollection(collection);
    _collections.add(collection);
    notifyListeners();
  }

  void updateCollection(Collection collection) async {
    await LocalDatabase.instance.updateCollection(collection);
    notifyListeners();
  }

  void deleteCollection(Collection collection) async {
    await LocalDatabase.instance.deleteCollection(collection);
    await this.pull();
    notifyListeners();
  }

  Collection getCollection(String name) {
    return _collections.firstWhere((element) => element.name == name);
  }
}