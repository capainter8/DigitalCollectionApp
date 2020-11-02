import 'package:DigitalCollectionApp/models/Collection.dart';
import 'package:DigitalCollectionApp/models/CollectionItem.dart';
import 'package:DigitalCollectionApp/models/CollectionViewerProxy.dart';
import 'package:DigitalCollectionApp/models/Schema.dart';
import 'package:DigitalCollectionApp/screens/collection_viewing/CollectionItemList.dart';
import 'package:DigitalCollectionApp/services/CollectionManager.dart';
import 'package:flutter/material.dart';
import 'package:DigitalCollectionApp/models/fields/field_model.dart' as f;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  CollectionViewerProxy proxy;

  @override
  Widget build(BuildContext context) {

    createTestItemList();

    Widget list = CollectionItemList(proxy);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Book Collection")),
        body: CollectionItemList(proxy)
        )
      );
  }

  void createTestItemList() {

    // 1. Create a schema
    Schema s = Schema();

    f.Field f1 = f.TextField("Title");
    f.FieldUtil.setValue(f1, "Gulliver's Travels");

    f.Field f2 = f.DecimalField("Weight (kg)");
    f.FieldUtil.setValue(f2, 0.567);

    f.Field f3 = f.TextField("Author");
    f.FieldUtil.setValue(f3, "Johnathan Swift");

    f.Field f4 = f.TextField("Publish Date");
    f.FieldUtil.setValue(f4, "28 October 1726");

    s.addField(f1);
    s.addField(f3);
    s.addField(f4);
    s.addField(f2);

    // 2. Create a collection item
    CollectionItem item = CollectionItem(s);
    item.addField(f1);
    item.addField(f3);
    item.addField(f4);
    item.addField(f2);

    // 3. Create a collection
    Collection collection = new Collection(
      "Books",
      "Some books",
      DateTime.now(),
      s
    );

    // 3. Get the collection manager
    CollectionManager manager = CollectionManager.instance;

    // 4. Add the collection to the manager
    manager.addCollection(collection);
    manager.addCollectionItem(collection, item);

    f.Field f5 = f.TextField("Title");
    f.FieldUtil.setValue(f5, "Leviathan");

    f.Field f6 = f.DecimalField("Weight (kg)");
    f.FieldUtil.setValue(f6, 1.023);

    f.Field f7 = f.TextField("Author");
    f.FieldUtil.setValue(f7, "Thomas Hobbes");

    f.Field f8 = f.TextField("Publish Date");
    f.FieldUtil.setValue(f8, "April 1651");

    CollectionItem item2 = CollectionItem(s);
    item2.addField(f5);
    item2.addField(f7);
    item2.addField(f8);
    item2.addField(f6);

    manager.addCollectionItem(collection, item2);

    // 6. Instantiate the collection proxy
    proxy = CollectionViewerProxy("Books");
  }
}