import 'package:DigitalCollectionApp/models/CollectionItem.dart';
import 'package:DigitalCollectionApp/models/Schema.dart';
import 'package:DigitalCollectionApp/models/fields/Fields.dart';

int main() {

  IntegerField f1 = IntegerField('count', 100);
  IntegerField f2 = IntegerField('count', 200);
  IntegerField f3 = IntegerField('count', 300);
  IntegerField f4 = IntegerField('count', 400);
  IntegerField f5 = IntegerField('count', 500);
  IntegerField f6 = IntegerField('count', 600);

  Schema schema = Schema.fromList(
    entries: [
      SchemaEntry('count', FieldType.IntegerField),
    ]
  );

  CollectionItem item1 = CollectionItem(schema);
  item1.addField(f1);

  CollectionItem item2 = CollectionItem(schema);
  item2.addField(f2);

  CollectionItem item3 = CollectionItem(schema);
  item3.addField(f3);

  CollectionItem item4 = CollectionItem(schema);
  item4.addField(f4);

  CollectionItem item5 = CollectionItem(schema);
  item5.addField(f5);

  CollectionItem item6 = CollectionItem(schema);
  item6.addField(f6);

  int result = item1.compareTo(item2, f1);

  print(result);

  List<CollectionItem> items = [
    item2,
    item1,
    item4,
    item6,
    item5,
    item3
  ];

  items.sort((CollectionItem a, CollectionItem b) {
    return a.compareTo(b, f1);
  });

  return 0;
}