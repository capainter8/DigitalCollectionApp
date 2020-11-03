

import 'package:DigitalCollectionApp/models/Collection.dart';
import 'package:DigitalCollectionApp/models/CollectionItem.dart';
import 'package:DigitalCollectionApp/models/Schema.dart';
import 'package:DigitalCollectionApp/models/fields/field_model.dart';
import 'package:DigitalCollectionApp/services/LocalDatabase.dart';
import 'package:flutter/cupertino.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  TextField make = TextField("Make");
  make.value = "Nissan";
  TextField model = TextField("Model");
  model.value = "Skyline";
  DecimalField horsepower = DecimalField("Horsepower");
  horsepower.value = 273;

  Schema schema = Schema();
  schema.addField(make);
  schema.addField(model);
  schema.addField(horsepower);

  Collection cars = Collection.build(
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
  db.insertCollection(cars);

  var fCars = await db.getCollectionByName('Cars');

  print('done');
}