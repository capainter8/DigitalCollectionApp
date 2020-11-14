import 'package:DigitalCollectionApp/screens/collection_management/CollectionListItem.dart';
import 'package:flutter/material.dart';
import '../../models/Collection.dart';
import '../../services/CollectionManager.dart';
import 'package:provider/provider.dart';

class CollectionListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CollectionListView();
  }
}

class _CollectionListView extends State<CollectionListView> {

  @override
  void initState() {
    CollectionManager.instance.update();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    context.watch<CollectionManager>();

    return FutureBuilder(
      future: getCollections(),
      builder: (BuildContext context, AsyncSnapshot<List<Collection>> snapshot) {
        List<Widget> children = List<Widget>();
        if (snapshot.hasData) {
          children.addAll(snapshot.data.map((collection) {
            return CollectionListItem(collection: collection);
          }));
        } else {
          // Wait...
        }
        return ListView.separated (
          itemCount: children.length,
          itemBuilder: (context, index) {
            return children.elementAt(index);
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        );
      }
    );
  }

  getCollections() {
    return CollectionManager.instance.getAllCollections();
  }
}