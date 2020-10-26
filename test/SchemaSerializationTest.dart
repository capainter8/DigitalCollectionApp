import 'package:DigitalCollectionApp/models/fields/Fields.dart' as Fields;
import 'package:DigitalCollectionApp/models/Schema.dart';

void main() {

  Fields.TextField f1 = new Fields.TextField("Author");
  f1.value = "J.K. Rowling";

  Fields.DecimalField f2 = new Fields.DecimalField("Velocity");
  f2.value = 345.67;

  Schema schema = new Schema();
  schema.addField(f1);
  schema.addField(f2);

  String json = schema.serialize();
  print(json);

  Schema schema2 = Schema();
  schema2.load(json);

  print("done");
}