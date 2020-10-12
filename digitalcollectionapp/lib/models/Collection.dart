/// Collection.dart
///
/// Model class for a collection. Contains a schema, a list of collection items,
/// a name, and a description.

import 'CollectionItem.dart';

class Collection {

  List<CollectionItem> items;
  String name;
  String description;

  Collection() {
    this.items = new List<CollectionItem>();
    this.name = "<name>";
    this.description = "<description>";
  }

  void addItem(CollectionItem item)
  {
    this.items.add(item);
  }

  List<CollectionItem> getCollectionItems() {
    return this.items;
  }
}