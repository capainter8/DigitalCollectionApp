import 'package:DigitalCollectionApp/models/Collection.dart';
import 'package:DigitalCollectionApp/models/CollectionItem.dart';
import 'package:DigitalCollectionApp/models/CollectionViewerProxy.dart';
import 'package:DigitalCollectionApp/widgets/collection_item/CollectionItemCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollectionItemList extends StatefulWidget {

  final CollectionViewerProxy collection;
  CollectionItemList(this.collection);

  @override
  State<StatefulWidget> createState() {
    return _ListItemState();
  }
}

class _ListItemState extends State<CollectionItemList> {

  @override
  Widget build(BuildContext context) {

    context.watch<Collection>();
    this.widget.collection.refresh();

    return ListView.builder(
      itemCount: this.widget.collection.itemsProxy.length,
      itemBuilder: (context, index) {
        CollectionItem current = this.widget.collection.itemsProxy.elementAt(index);
        return CollectionItemCard(current);
      },
    );
  }
}
