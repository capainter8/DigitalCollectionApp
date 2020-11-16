import 'file:///C:/Users/Cody/StudioProjects/DigitalCollectionApp/lib/widgets/common/field_input_lines/DateInputLine.dart';
import 'package:DigitalCollectionApp/widgets/common/FormRowItem.dart';
import 'package:DigitalCollectionApp/widgets/common/Label.dart';
import 'package:DigitalCollectionApp/widgets/common/LabeledTextField.dart';
import 'package:flutter/material.dart';

class DateFieldConfigWidget extends StatefulWidget {
  @override
  _DateFieldConfigWidgetState createState() => _DateFieldConfigWidgetState();
}

class _DateFieldConfigWidgetState extends State<DateFieldConfigWidget> {

  DateTime _dateTime;
  final _formKey = GlobalKey<FormState>();

  _DateFieldConfigWidgetState() {
    this._dateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormRowItem(
            spacing: 48.0,
            children: [
              LabeledTextField(label: 'Field Name', hint: 'enter name...',),
            ],
          ),
        ]
      )
    );
  }

  _getDateText() {
    if (_dateTime == null) {
      return Text('Please choose date...');
    } else {
      return Text(_dateTime.toString());
    }
  }

  _pickDateButton(Color color) {
    return MaterialButton(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.date_range),
          Text('Choose date')
        ],
      ),
      onPressed: () {
        // Show the date picker
      },
    );
  }
}
