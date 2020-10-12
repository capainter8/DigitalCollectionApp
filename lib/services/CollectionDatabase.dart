import '../models/Collection.dart';
import 'dart:async';

class CollectionDatabase {

  static Future<List<Collection>> fetchCollections() async {

    // Fetch collections from the database

    // For testing - create a list of collections and return them in a future.
    List<Collection> collections = new List<Collection>();

    collections.add(
      Collection(
        "Old First Edition Books",
        "Contains old first edition books, mostly american literature pre 1900's.",
        DateTime(2019, 100)
      )
    );

    collections.add(
        Collection(
            "Stamp Collection",
            "Collection of canada post stamps.",
            DateTime(2020, 185)
        )
    );

    return collections;
  }
}