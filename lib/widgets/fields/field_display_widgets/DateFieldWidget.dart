import 'package:DigitalCollectionApp/models/fields/Fields.dart';
import 'package:DigitalCollectionApp/widgets/fields/field_display_widgets/BaseFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFieldWidget extends StatelessWidget {

  Field field;
  DateFieldWidget(this.field);

  @override
  Widget build(BuildContext context) {

    DateFormat dateFormat = DateFormat.yMMMMd('en_US');
    DateTime date = this.field.value as DateTime;

    return BaseField(
      this.field.name,
      Text(dateFormat.format(date)),
    );
  }
}
