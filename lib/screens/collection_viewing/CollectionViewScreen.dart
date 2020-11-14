
import 'package:DigitalCollectionApp/models/CollectionItem.dart';
import 'package:DigitalCollectionApp/models/CollectionViewerProxy.dart';
import 'package:DigitalCollectionApp/models/fields/Fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  CollectionItemList collectionItemList;

  @override
  Widget build(BuildContext context) {
    collectionItemList = CollectionItemList(CollectionViewerProxy(collectionName));
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
              child: TextFormField(
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
                    CollectionViewerProxy c =CollectionViewerProxy(collectionName);
                    showFields(context, c);
              },))
            ],),),
            Expanded(
              child: collectionItemList,
                  )] 
              ),
            ),
        );
  }

  showFields(BuildContext context, CollectionViewerProxy c)
  {
     showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            height: MediaQuery.of(context).size.height  * 0.4,
            child: Center(
             child: Column(children: [
               Text("Sort By:"),
               Expanded(child:ListView.builder(
  itemCount: c.schemaProxy.getEntryNames().length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text('${c.schemaProxy.getEntryNames()[index]}'),
    onTap: () {
      if(c.itemsProxy.isNotEmpty)
      {
      sortByField(c,collectionItemList,c.itemsProxy.elementAt(0).getField(c.schemaProxy.getEntryNames()[index]));
      }
      else
      {
        Fluttertoast.showToast(msg: "You must have items created to sort");
      }
      Navigator.pop(context);
    },);
        }))])));   
  }); 
}

sortByField(CollectionViewerProxy collectionViewerProxy, CollectionItemList cItemList, Field f)
{
  setState(() {
    collectionViewerProxy.itemsProxy.sort((CollectionItem a, CollectionItem b) {
    return a.compareTo(b,f);
  });
  cItemList = CollectionItemList(collectionViewerProxy);
  });
}

}