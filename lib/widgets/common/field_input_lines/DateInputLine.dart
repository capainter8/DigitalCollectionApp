import 'package:DigitalCollectionApp/models/Schema.dart';
import 'package:DigitalCollectionApp/screens/CreateCollectionItemScreen.dart';
import 'package:DigitalCollectionApp/widgets/common/BorderedWidget.dart';
import 'package:DigitalCollectionApp/widgets/common/FormRowItem.dart';
import 'package:DigitalCollectionApp/widgets/common/Label.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DateInputLine extends StatefulWidget {
  final DateTime date;
  final double borderRadius;
  final DateFormat dateFormat; // = DateFormat.yMMMMd('en_US');
  final SchemaEntry entry;

  DateInputLine(this.entry, {this.borderRadius = 12.0, date, dateFormat})
      : this.date = date ?? DateTime.now(),
        this.dateFormat = DateFormat.yMMMMd('en_US');

  @override
  _DateInputLineState createState() => _DateInputLineState();
}

class _DateInputLineState extends State<DateInputLine> {
  DateTime displayDate;

  @override
  void initState() {
    displayDate = this.widget.date;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FormFieldsModel model =
        Provider.of<FormFieldsModel>(context, listen: false);

    String labelText = this.widget.entry.name;
    if (this.widget.entry.required) {
      labelText += "*";
    }

    return FormRowItem(
      children: [
        StringLabel(labelText),
        InkWell(
          onTap: () {
            _showDatePicker(context, model, this.widget.entry);
          },
          child: BorderedWidget(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(_getFormattedDate()), Icon(Icons.date_range)],
            ),
          ),
        ),
      ],
    );
  }

  _getFormattedDate() {
    return this.widget.dateFormat.format(this.displayDate);
  }

  void _showDatePicker(
      BuildContext context, FormFieldsModel model, SchemaEntry entry) async {
    DateTime chosenDate = await showDatePicker(
      context: context,
      initialDate: this.displayDate,
      firstDate: DateTime(0),
      lastDate: DateTime(DateTime.now().year + 100),
    );
    if (chosenDate == null) return;
    setState(() {
      model.setField(entry.name, chosenDate);
      displayDate = chosenDate;
    });
  }
}
