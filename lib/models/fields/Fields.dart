import 'package:DigitalCollectionApp/models/fields/FieldType.dart';

abstract class Field {

  final String name;
  Field._(this.name);

  void accept(FieldVisitor visitor) => visitor.visit(this);
  FieldType getType();
}

abstract class FieldVisitor {
  void visit(Field field);
}

class TextField extends Field {

  TextField(name) : super._(name);

  String value;

  @override
  FieldType getType() {
    return FieldType.TextField;
  }
}

class DecimalField extends Field {

  DecimalField(name) : super._(name);

  double value;

  @override
  FieldType getType() {
    return FieldType.DecimalField;
  }
}