import 'package:DigitalCollectionApp/models/fields/FieldType.dart';

abstract class Field {

  final String name;
  final bool required;
  Field._(this.name, this.required);

  void accept(FieldVisitor visitor) => visitor.visit(this);
  FieldType getType();
}

abstract class FieldVisitor {
  void visit(Field field);
}

/// Text Field
///
class TextField extends Field {

  TextField(name, {required = false}) : super._(name, required);

  String value;

  @override
  FieldType getType() {
    return FieldType.TextField;
  }
}

/// Decimal Field
///
class DecimalField extends Field {

  DecimalField(name, {required = false}) : super._(name, required);

  double value;

  @override
  FieldType getType() {
    return FieldType.DecimalField;
  }
}