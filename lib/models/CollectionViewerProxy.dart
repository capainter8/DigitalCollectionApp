import 'package:DigitalCollectionApp/models/Collection.dart';
import 'package:DigitalCollectionApp/models/CollectionItem.dart';
import 'package:DigitalCollectionApp/models/Schema.dart';
import 'package:DigitalCollectionApp/services/CollectionManager.dart';

/// CollectionViewerProxy
///
/// This class should provide an interface to retrieve, search, sort, and filter
/// the collection items in a given collection.
/// The collection view screen will use this class to display items to the user.

// TODO: Finish the implementation of this class
class CollectionViewerProxy {

  List<CollectionItem> items;
  Schema schema;

  CollectionViewerProxy(String collectionName) {
    Collection collection = CollectionManager.instance.getCollection(collectionName);
    items = collection.items;
    schema = collection.schema;
  }

  // TODO: Add searching, sorting, and filtering capabilities
}