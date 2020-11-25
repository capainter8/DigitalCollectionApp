import 'package:DigitalCollectionApp/models/Collection.dart';
import 'package:DigitalCollectionApp/models/CollectionViewerProxy.dart';
import 'package:DigitalCollectionApp/screens/collection_viewing/CollectionSearchBar.dart';
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
  _ViewScreenState();
  CollectionItemList collectionItemList;

  CollectionViewerProxy proxy;

  @override
  Widget build(BuildContext context) {

    Collection collection = ModalRoute.of(context).settings.arguments;
    if (proxy == null) {
      proxy = CollectionViewerProxy(collection.name);
      collection.addListener(() { // The proxy listens for changes in the collection
        proxy.onCollectionChanged();
      });
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: collection),
        ChangeNotifierProvider.value(value: proxy),
      ],
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(collection.name),
          actions: [
            _addItemIconButton(collection),
          ],
        ),
        body: GestureDetector( // For closing the keyboard
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                child: CollectionSearchBar(),
              ),
              CollectionItemList(),
            ],
          ),
        ),
      ),
    );
  }

  _addItemIconButton(Collection collection) {
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: () {
        Navigator.pushNamed(context, CreateCollectionItemScreen.route,
            arguments: collection);
      },
    );
  }
}
