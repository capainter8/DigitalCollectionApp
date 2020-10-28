import 'package:DigitalCollectionApp/models/CollectionItem.dart';
import 'package:DigitalCollectionApp/models/Schema.dart';
import 'package:DigitalCollectionApp/screens/collection_management/CollectionListItem.dart';
import 'package:DigitalCollectionApp/services/LocalDatabase.dart';
import 'package:flutter/material.dart';
import '../../models/Collection.dart';
import '../../services/CollectionManager.dart';
import 'package:DigitalCollectionApp/models/fields/field_model.dart' as f;

class CollectionListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CollectionListView();
  }
}

class _CollectionListView extends State<CollectionListView> {

  Future<List<CollectionListItem>> getCollectionWidgets() async {
    await insertTestCollection();

    try {
      await CollectionManager.instance.load();
    } catch (e, trace) {
      print(trace);
    }

    List<Collection> collections = await CollectionManager.instance.getAllCollections();
    return collections.map((collection) => CollectionListItem(collection: collection)).toList();
  }

  insertTestCollection() async {

    WidgetsFlutterBinding.ensureInitialized();

    f.TextField make = f.TextField("Make");
    make.value = "Nissan";
    f.TextField model = f.TextField("Model");
    model.value = "Skyline";
    f.DecimalField horsepower = f.DecimalField("Horsepower");
    horsepower.value = 273;

    Schema schema = Schema();
    schema.addField(make);
    schema.addField(model);
    schema.addField(horsepower);

    Collection cars = Collection(
        'Cars',
        'A collection of cars',
        DateTime.now(),
        schema
    );

    CollectionItem nissan = CollectionItem(schema);
    nissan.addField(make);
    nissan.addField(model);
    nissan.addField(horsepower);

    cars.add(nissan);

    LocalDatabase db = LocalDatabase.instance;
    await db.insertCollection(cars);
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
}