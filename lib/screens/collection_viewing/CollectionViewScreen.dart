import 'package:DigitalCollectionApp/models/Collection.dart';
import 'package:DigitalCollectionApp/models/CollectionViewerProxy.dart';
import 'package:provider/provider.dart';
import '../CreateCollectionItemScreen.dart';
import 'CollectionItemList.dart';
import 'package:flutter/material.dart';

class CollectionViewScreen extends StatefulWidget {

  static final String route = '/view_collection';

  @override
  State<StatefulWidget> createState() {
    return _ViewScreenState();
  }
}

class _ViewScreenState extends State<CollectionViewScreen> {
  @override
  Widget build(BuildContext context) {
    Collection collection = ModalRoute.of(context).settings.arguments;

    return ChangeNotifierProvider.value(
      value: collection,
      child: Scaffold(
        appBar: AppBar(
          title: Text(collection.name),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, CreateCollectionItemScreen.route,
                    arguments: collection);
              },
            ),
          ],
        ),
        body: CollectionItemList(
            CollectionViewerProxy(collection.name)
        ),
      ),
    );
  }
}
