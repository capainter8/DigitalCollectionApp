import 'package:DigitalCollectionApp/models/Collection.dart';
import 'package:DigitalCollectionApp/models/fields/Fields.dart' as Fields;
import 'package:DigitalCollectionApp/models/Schema.dart';
import 'package:DigitalCollectionApp/models/CollectionItem.dart';

/// Check if the collection item class is working properly
void main() {

  Fields.TextField f1 = new Fields.TextField("Author");
  f1.value = "J.K. Rowling";

  Fields.DecimalField f2 = new Fields.DecimalField("Velocity");
  f2.value = 345.67;

  Schema schema = new Schema();
  schema.addField(f1);
  schema.addField(f2);

  CollectionItem item = CollectionItem(schema);
  item.addField(f1);
  item.addField(f2);

  String serialized = item.serialize();

  CollectionItem itemCopy = CollectionItem(schema);
  itemCopy.load(serialized);

  itemCopy.updateField("Velocity", 999.00);

  itemCopy.removeField("Velocity");

  Collection collection = Collection(
    'coins',
    'coins in here.',
    DateTime.now(),
    schema
  );

  collection.add(item);

  String srlzdstr = collection.serializeItems();

  Collection collection2 = new Collection(
    'coins',
    'coins in here',
    DateTime.now(),
    schema
  );

  collection2.loadItems(srlzdstr);

  print("done");
}