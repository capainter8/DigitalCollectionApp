import 'package:DigitalCollectionApp/models/Schema.dart';
import 'package:DigitalCollectionApp/screens/CreateCollectionItemScreen.dart';
import 'package:DigitalCollectionApp/widgets/common/FormRowItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CustomTextField.dart';
import '../Label.dart';

class DecimalInputLine extends StatefulWidget {
  final SchemaEntry entry;
  DecimalInputLine(this.entry);

  @override
  _DecimalInputLineState createState() => _DecimalInputLineState();
}

class _DecimalInputLineState extends State<DecimalInputLine> {
  @override
  Widget build(BuildContext context) {
    FormFieldsModel model =
    Provider.of<FormFieldsModel>(context, listen: false);

    String labelText = this.widget.entry.name;
    if (this.widget.entry.required) {
      labelText += '*';
    }

    return FormRowItem(
      children: [
        StringLabel(labelText),
        CustomTextField(
          keyboard: TextInputType.number,
          validator: (value) {
            if (value.contains(" ") ||
                value.contains(",") ||
                (!value.startsWith("-") && value.contains("-")) || // Fix input bug
                value.startsWith("0")) {
              return "Enter a valid decimal number";
            }
            return null;
          },
          hint: "enter " + this.widget.entry.name + "...",
          onChanged: (value) {
            double parsed = double.tryParse(value);
            model.setField(this.widget.entry.name, parsed);
          },
        ),
      ],
    );
  }
}