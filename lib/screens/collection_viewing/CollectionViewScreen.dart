import 'package:DigitalCollectionApp/models/CollectionViewerProxy.dart';
import 'CollectionItemList.dart';
import 'package:flutter/material.dart';

/// CollectionViewScreen.dart
/// This is the screen where the user can brows the items in a given collection

class CollectionViewScreen extends StatefulWidget {

  String collectionName;
  CollectionViewScreen(this.collectionName);

  @override
  State<StatefulWidget> createState() {
    return _ViewScreenState(collectionName);
  }
}

class _ViewScreenState extends State<CollectionViewScreen> {

  String collectionName;
  _ViewScreenState(this.collectionName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(collectionName),
      ),
      body: Column(
        children: [
          CollectionItemList(CollectionViewerProxy(collectionName)),
        ]
      )
    );
  }
}