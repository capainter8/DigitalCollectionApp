import 'package:DigitalCollectionApp/models/Schema.dart';
import 'package:DigitalCollectionApp/screens/CreateCollectionItemScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CustomTextField.dart';
import '../FormRowItem.dart';
import '../Label.dart';

class TextInputLine extends StatefulWidget {

  final SchemaEntry entry;
  TextInputLine(this.entry);

  @override
  _TextInputLineState createState() => _TextInputLineState();
}

class _TextInputLineState extends State<TextInputLine> {
  @override
  Widget build(BuildContext context) {

    FormFieldsModel model = Provider.of<FormFieldsModel>(context, listen: false);

    String labelText = this.widget.entry.name;
    if (this.widget.entry.required) {
      labelText += '*';
    }

    return FormRowItem(
      children: [
        StringLabel(labelText),
        CustomTextField( // this should listen for provider changes
          onChanged: (value) {
            model.setField(this.widget.entry.name, value);
            // Set the value of the model
          },
          hint: "enter " + this.widget.entry.name,
        )
      ],
    );
  }
}
