import 'package:DigitalCollectionApp/models/Schema.dart';
import 'package:DigitalCollectionApp/screens/CreateCollectionItemScreen.dart';
import 'package:DigitalCollectionApp/widgets/common/FormRowItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CustomTextField.dart';
import '../Label.dart';

class IntegerInputLine extends StatefulWidget {
  final SchemaEntry entry;
  IntegerInputLine(this.entry);

  @override
  _IntegerInputLineState createState() => _IntegerInputLineState();
}

class _IntegerInputLineState extends State<IntegerInputLine> {
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
            if (value.contains(".") ||
                value.contains(" ") ||
                value.contains(",") ||
                value.contains("-") ||
                value.startsWith("0")) {
              return "Enter a valid integer";
            }
            return null;
          },
          hint: "enter " + this.widget.entry.name + "...",
          onChanged: (value) {
            int parsed = int.tryParse(value);
            model.setField(this.widget.entry.name, parsed);
          },
        ),
      ],
    );
  }
}
