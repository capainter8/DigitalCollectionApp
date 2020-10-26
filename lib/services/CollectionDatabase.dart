/// CollectionDatabase.dart
///
/// The purpose of this class is to abstract the database operations needed
/// by the application from its implementation. Using this method, modules of
/// the application that use the database don't need to worry about whether
/// the data is stored locally or in the cloud.

import '../models/Collection.dart';
import '../models/CollectionItem.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';

class CollectionDatabase {

  static List<Collection> _collections;

  static void init() {
    _collections = new List<Collection>();

    // Init the database (For now just test data)
    _collections.add(
        Collection(
            UniqueKey(),
            "Old First Edition Books",
            "Collection of old first edition books, mostly American literature pre 1900's.",
            DateTime(2019, 100)
        )
    );

    _collections.add(
        Collection(
            UniqueKey(),
            "Stamp Collection",
            "Collection of stamps.",
            DateTime(2020, 185)
        )
    );
  }

  static Future<List<Collection>> fetchCollections() async {

    if (_collections == null) init();

    return _collections;
  }

  /// This may seem redundant but the idea is that whenever an item is added
  /// to a collection it will be handled by this class. That way when items
  /// are added, the items can be pushed to the database. If users could add
  /// items directly into the collection object, the new data would not
  /// be synced with the database, or database logic would have to be put into
  /// the Collection class. This may be changed later on if I can find a better
  /// design.
  static void addCollectionItem(Collection collection, CollectionItem collectionItem) {
    collection.addItem(collectionItem);
  }
}