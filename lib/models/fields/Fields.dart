enum FieldType {
  TextField,
  DecimalField,
  DateField,
  IntegerField
}

/// Base Field -----------------------------------------------------------------

abstract class Field {

  String    name;
  dynamic   _value;

  Field._(this.name, this._value);
  Field._load(this.name, dynamic serialized) {
    _value = _deserialize(serialized);
  }

  void accept(FieldVisitor visitor) => visitor.visit(this);

  get value;
  set value(dynamic value);

  get type;

  dynamic serialize();
  dynamic _deserialize(dynamic serialized);
}

abstract class FieldVisitor {
  void visit(Field field);
}

/// Text Field -----------------------------------------------------------------

class TextField extends Field with ComparableField {
  TextField(String name, String value) :
      super._(name, value);
  
  TextField.load(String name, dynamic value) :
      super._load(name, value);

  @override
  String get value {
    return _value;
  }

  @override
  set value(value) {
    _value = value as String;
  }

  @override
  get type => FieldType.TextField;

  @override
  String _deserialize(dynamic serialized) {
    return serialized;
  }

  @override
  String serialize() {
    return value;
  }

  @override
  int compareTo(Field other) {
    return this.value.compareTo(other.value);
  }
}

/// DecimalField ---------------------------------------------------------------

class DecimalField extends Field with ComparableField {
  DecimalField(String name, double value) :
        super._(name, value);
  
  DecimalField.load(String name, dynamic value) :
      super._load(name, value);

  @override
  double get value {
    return _value;
  }

  @override
  set value(value) {
    _value = value as double;
  }

  @override
  get type => FieldType.DecimalField;

  // Double type can be stored in json directly
  @override
  double _deserialize(dynamic serialized) {
    return serialized;
  }

  @override
  double serialize() {
    return value;
  }

  @override
  int compareTo(Field other) {
    if (this.value < other.value) return -1;
    if (this.value > other.value) return 1;
    return 0;
  }
}

/// Date type ------------------------------------------------------------------

class DateField extends Field with ComparableField {
  DateField(String name, DateTime value) :
        super._(name, value);

  DateField.load(String name, dynamic value) :
        super._load(name, value);

  set value(value) {
    _value = value as DateTime;
  }

  DateTime get value {
    return _value;
  }

  @override
  DateTime _deserialize(serialized) {
    return DateTime.tryParse(serialized);
  }

  @override
  String serialize() {
    return value.toIso8601String();
  }

  @override
  // TODO: implement type
  get type => FieldType.DateField;

  @override
  int compareTo(Field other) {
    return this.value.compareTo(other.value);
  }
}

/// Integer Type ---------------------------------------------------------------

class IntegerField extends Field with ComparableField {
  IntegerField(String name, int value) :
        super._(name, value);

  IntegerField.load(String name, dynamic value) :
        super._load(name, value);

  @override
  int get value {
    return _value;
  }

  @override
  set value(dynamic value) {
    _value = value as int;
  }

  @override
  _deserialize(serialized) { // int compatible with json
    return serialized;
  }

  @override
  int serialize() {
    return value;
  }

  @override
  // TODO: implement type
  get type => FieldType.IntegerField;

  @override
  int compareTo(Field other) {
    if (this.value < other.value) return -1;
    if (this.value > other.value) return 1;
    return 0;
  }
}

/// Field Utility Functions ----------------------------------------------------

String fieldTypeToString(FieldType type) {
  switch (type) {
    case FieldType.TextField: return 'Text';
    case FieldType.DecimalField: return 'Decimal';
    case FieldType.DateField: return 'Date';
    case FieldType.IntegerField: return 'Integer';
    default: return 'Unknown';
  }
}

Field loadField(FieldType type, String name, dynamic value) {
  switch (type) {
    case FieldType.TextField:
      _guardType(value, String);
      return TextField.load(name, value);

    case FieldType.DecimalField:
      _guardType(value, double);
      return DecimalField.load(name, value);

    case FieldType.DateField:
      _guardType(value, String);
      return DateField.load(name, value);

    case FieldType.IntegerField:
      _guardType(value, int);
      return IntegerField.load(name, value);

    default:
      throw Exception("Tried build field from unknown type");
  }
}

_guardType(dynamic value, Type targetType) {
  if (value.runtimeType != targetType)
    throw FormatException(_formatExceptionMessage(value, targetType));
}

_formatExceptionMessage(dynamic value, Type runtimeType) {
  return "Error creating typed field: Cannot assign " +
      value.runtimeType.toString() + " to a " + runtimeType.toString();
}

/// Comparator Class -----------------------------------------------------------

abstract class ComparableField {
  int compareTo(Field other);
}