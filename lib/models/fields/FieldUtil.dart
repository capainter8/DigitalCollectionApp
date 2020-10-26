import 'package:DigitalCollectionApp/models/fields/Fields.dart' as f;
import 'package:DigitalCollectionApp/models/fields/FieldType.dart';

class FieldUtil {

  static f.Field load(FieldType type, String name, dynamic value) {
    if (type == FieldType.TextField) {
      f.TextField field = f.TextField(name);
      field.value = value as String;
      return field;
    }
    else if (type == FieldType.DecimalField) {
      f.DecimalField field = f.DecimalField(name);
      field.value = value as double;
      return field;
    }
    else {
      throw UnimplementedError("FieldType not implemented in field loader.");
    }
  }

  static dynamic getValue(f.Field field) {
    if (field is f.TextField) {
      return field.value;
    }
    else if (field is f.DecimalField) {
      return field.value;
    }
    else {
      throw UnimplementedError("Could not get the value of this field type.");
    }
  }

  static void setValue(f.Field field, dynamic value) {
    if (field is f.TextField) {
      if (value is String) {
        field.value = value;
      }
      else {
        _throwValueException(value, field.value);
      }
    }
    else if (field is f.DecimalField) {
      if (value is double) {
        field.value = value;
      }
      else {
        _throwValueException(value, field.value);
      }
    }
    else {
      throw UnimplementedError("Field type not implemented.");
    }
  }

  static void _throwValueException(dynamic value, dynamic targetValue) {
    String valueType = value.runtimeType.toString();
    String targetValueType = targetValue.runtimeType.toString();
    throw Exception("Cannot assign type $valueType to field type $targetValueType.");
  }
}