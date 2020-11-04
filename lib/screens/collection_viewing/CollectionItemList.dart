import 'package:DigitalCollectionApp/models/CollectionItem.dart';
import 'package:DigitalCollectionApp/models/CollectionViewerProxy.dart';
import 'package:DigitalCollectionApp/widgets/collection_item/CollectionItemCard.dart';
import 'package:flutter/material.dart';

/// CollectionItemList.dart

class CollectionItemList extends StatefulWidget {

  // A reference to the items in a collection
  CollectionViewerProxy collection;

  CollectionItemList(CollectionViewerProxy itemList) {
    this.collection = itemList;
  }

  @override
  State<StatefulWidget> createState() {
    return _ListItemState(collection.itemsProxy);
  }
}

class _ListItemState extends State<CollectionItemList> {

  List<CollectionItem> items;
  _ListItemState(this.items);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        // get the collection
        CollectionItem current = items.elementAt(index);
        return CollectionItemCard(current);
      }
    );
  }
}