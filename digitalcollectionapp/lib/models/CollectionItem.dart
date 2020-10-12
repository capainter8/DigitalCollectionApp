/// CollectionItem.dart
///
/// This is the model class for a collection item. It stores <key, value> data
/// that is acquired from a collection item JSON string. Queries on the data
/// in this class should be based on the schema defined in the CollectionItems
/// parent Collection.
///

class CollectionItem {

  Map fields;

  CollectionItem() {
    this.fields = new Map();
  }

  void addField(String key, String value) {
    this.fields[key] = value;
  }

  void getField(String key) {
    return this.fields[key];
  }
}