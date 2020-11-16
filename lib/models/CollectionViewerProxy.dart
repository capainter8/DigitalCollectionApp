import 'package:DigitalCollectionApp/models/Collection.dart';
import 'package:DigitalCollectionApp/models/CollectionItem.dart';
import 'package:DigitalCollectionApp/models/Schema.dart';
import 'package:DigitalCollectionApp/services/CollectionManager.dart';
import 'package:flutter/material.dart';

import 'fields/Fields.dart';

/// CollectionViewerProxy
///
/// This class should provide an interface to retrieve, search, sort, and filter
/// the collection items in a given collection.
/// The collection view screen will use this class to display items to the user.

// TODO: Finish the implementation of this class
class CollectionViewerProxy extends ChangeNotifier {
  List<CollectionItem> itemsProxy;
  Collection collectionProxy;
  Schema schemaProxy;

  CollectionViewerProxy(String name) {
    collectionProxy = CollectionManager.instance.getCollection(name);
    schemaProxy = collectionProxy.schema;
    refresh();
  }

  void refresh() {
    itemsProxy = List.from(collectionProxy.items);
  }

  void sortByField(Field f) {
    this.itemsProxy.sort((CollectionItem a, CollectionItem b) {
      if (a.getField(f.name).value == null || b.getField(f.name).value == null) {
        return 1; // Null objects at the end
      }
      else {
        return a.compareTo(b, f);
      }
    });
    notifyListeners();
  }

  void searchFilter(String query) {
    refresh();
    this.itemsProxy.retainWhere((item) {
      return item.searchBlob()
          .toLowerCase()
          .contains(query.toLowerCase());
    });
    notifyListeners();
  }

  void onCollectionChanged() {
    refresh();
    notifyListeners();
  }
}
