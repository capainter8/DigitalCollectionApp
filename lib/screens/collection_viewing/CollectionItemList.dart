import 'package:DigitalCollectionApp/models/Collection.dart';
import 'package:DigitalCollectionApp/models/CollectionItem.dart';
import 'package:DigitalCollectionApp/models/CollectionViewerProxy.dart';
import 'file:///C:/Users/Cody/StudioProjects/DigitalCollectionApp/lib/screens/collection_viewing/CollectionItemCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollectionItemList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListItemState();
  }
}

class _ListItemState extends State<CollectionItemList> {

  @override
  Widget build(BuildContext context) {

    context.watch<Collection>();

    CollectionViewerProxy proxy = Provider.of<CollectionViewerProxy>(context);

    return Expanded(
      child: ListView.builder(
        itemCount: proxy.itemsProxy.length,
        itemBuilder: (context, index) {
          CollectionItem current = proxy.itemsProxy.elementAt(index);
          return CollectionItemCard(current);
        },
        padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
      ),
    );
  }
}
