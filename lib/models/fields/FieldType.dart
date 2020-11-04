import 'package:DigitalCollectionApp/models/fields/field_model.dart';

enum FieldType {
  TextField,
  DecimalField,
  Unknown
}

String fieldTypeToString(FieldType type) {
  switch (type) {
    case FieldType.TextField: return 'Text';
    case FieldType.DecimalField: return 'Decimal';
    case FieldType.Unknown: return 'Unknown';
    default: return 'Unknown';
  }
}