import 'package:DigitalCollectionApp/models/Collection.dart';
import 'package:DigitalCollectionApp/models/CollectionItem.dart';
import 'package:DigitalCollectionApp/models/CollectionViewerProxy.dart';
import 'package:DigitalCollectionApp/models/CreateCollectionModel.dart';
import 'package:flutter/cupertino.dart';
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
  TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    CollectionItemList collectionItemList = CollectionItemList(CollectionViewerProxy(collectionName));
    return Scaffold(
      appBar: AppBar(
        title: Text(collectionName),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: 
              Row(children: [
              Expanded(
              flex: 7, 
              child: TextField(
                onChanged: (string) {
                  setState(() {
                   CollectionViewerProxy collectionViewerProxy = CollectionViewerProxy(collectionName);
                  List<CollectionItem> itemList = collectionViewerProxy.itemsProxy;
                  List<CollectionItem> filteredItemList = collectionViewerProxy.itemsProxy;

                  filteredItemList = itemList.where((element) => 
                  (element.toString().toLowerCase().contains(string))).toList();

                  collectionViewerProxy.itemsProxy = filteredItemList;

                  collectionItemList = CollectionItemList(collectionViewerProxy);
    
                  });
                },
                controller: searchController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(icon:Icon(CupertinoIcons.sort_down_circle_fill),onPressed:(){
                    setState(() {
                      CollectionViewerProxy collectionViewerProxy2 = CollectionViewerProxy(collectionName);
                      collectionViewerProxy2.itemsProxy.sort();
                      collectionItemList = CollectionItemList(collectionViewerProxy2);
                    });
              },))
            ],),),
            Expanded(
              child: collectionItemList,
                  )] 
              ),
            ),
        );
  }
}