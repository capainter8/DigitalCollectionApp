import 'package:DigitalCollectionApp/screens/collection_management/CollectionListItem.dart';
import 'package:flutter/material.dart';
import '../../models/Collection.dart';
import '../../services/CollectionDatabase.dart';

class CollectionListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CollectionListView();
  }
}

class _CollectionListView extends State<CollectionListView> {

  Future<List<CollectionListItem>> getCollectionWidgets() async {
    List<Collection> collections = await CollectionDatabase.fetchCollections();
    List<CollectionListItem> widgets = collections.map((Collection collection) => CollectionListItem(collection: collection)).toList();
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCollectionWidgets(),
      builder: (BuildContext context, AsyncSnapshot<List<CollectionListItem>> snapshot) {
        List<Widget> children = List<Widget>();
        if (snapshot.hasData) {
          children.addAll(snapshot.data);
        } else {
          // Wait...
        }
        return ListView (
          children: children,
        );
      }
    );
  }
}