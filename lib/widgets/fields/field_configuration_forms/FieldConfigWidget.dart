import 'package:DigitalCollectionApp/models/Schema.dart';
import 'package:DigitalCollectionApp/widgets/common/FormRowItem.dart';
import 'package:DigitalCollectionApp/widgets/common/LabeledTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FieldConfigWidget extends StatefulWidget {
  final bool requiredState;
  final String inputText;
  FieldConfigWidget()
      : requiredState = false,
        inputText = null;

  @override
  _FieldConfigWidgetState createState() => _FieldConfigWidgetState();
}

class _FieldConfigWidgetState extends State<FieldConfigWidget> {

  bool requiredState;

  @override
  void initState() {
    requiredState = this.widget.requiredState;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    SchemaEntry newEntry = Provider.of<SchemaEntry>(context, listen: false);

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormRowItem(
            spacing: 48.0,
            children: [
              LabeledTextField(
                label: 'Field Name',
                hint: 'enter name...',
                onChanged: (value) {
                  newEntry.name = value;
                },
              ),
            ],
          ),
          FormRowItem(
            children: [
              CheckboxListTile(
                title: Text('Required'),
                value: requiredState,
                onChanged: (newValue) {
                  setState(
                    () {
                      newEntry.required = newValue;
                      requiredState = newValue;
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
