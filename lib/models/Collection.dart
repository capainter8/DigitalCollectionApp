/// Collection.dart
///
///

import "CollectionItem.dart";

class Collection {

  String name;
  String description;
  DateTime creationDate;
  List<CollectionItem> items;

  Collection (
      String name,
      String description,
      DateTime creationDate,
      ) {
    this.name = name;
    this.description = description;
    this.creationDate = creationDate;
  }

  String getName() {
    return name;
  }

  String getDescription() {
    return description;
  }

  DateTime getCreationDate() {
    return creationDate;
  }

  int getItemCount() {
    return items.length;
  }

  void addItem(CollectionItem item) {
    items.add(item);
  }
}