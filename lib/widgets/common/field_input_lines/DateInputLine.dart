import 'package:DigitalCollectionApp/widgets/common/BorderedWidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInputLine extends StatelessWidget {

  final DateTime date;
  final double borderRadius;
  final Function (DateTime chosen) onDateSet;

  final DateFormat dateFormat;// = DateFormat.yMMMMd('en_US');

  DateInputLine({
    this.borderRadius = 12.0,
    this.onDateSet,
    date,
    dateFormat })
      : this.date = date ?? DateTime.now(),
        this.dateFormat = DateFormat.yMMMMd('en_US');

  @override
  Widget build(BuildContext context) {
    return InkWell (
      onTap: () {
        _showDatePicker(context);
      },
      child: BorderedWidget(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_getFormattedDate()),
            Icon(Icons.date_range)
          ],
        )
      ),
    );
  }

  _getFormattedDate() {
    return this.dateFormat.format(this.date);
  }

  void _showDatePicker(BuildContext context) async {
    DateTime chosenDate = await showDatePicker(
        context: context,
        initialDate: this.date,
        firstDate: DateTime(0),
        lastDate: DateTime(DateTime.now().year + 100),
    );
    this.onDateSet(chosenDate);
  }
}
