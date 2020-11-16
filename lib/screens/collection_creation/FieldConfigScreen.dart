import 'package:DigitalCollectionApp/models/CreateCollectionModel.dart';
import 'package:DigitalCollectionApp/models/Schema.dart';
import 'package:DigitalCollectionApp/models/fields/Fields.dart';
import 'package:DigitalCollectionApp/widgets/fields/field_configuration_forms/FieldConfigWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FieldConfigScreen extends StatelessWidget {
  FieldConfigScreen();

  @override
  Widget build(BuildContext context) {
    final FieldType type = ModalRoute.of(context).settings.arguments;
    SchemaEntry newEntry = SchemaEntry("", type);

    return Scaffold(
      appBar: AppBar(
        title: Text("Configure Field"),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return FlatButton(
                child: Text('CREATE'),
                onPressed: () {
                  var model = Provider.of<CreateCollectionModel>(context, listen: false);
                  if (newEntry.name != null && newEntry.name != "") {
                    if (!model.hasFieldName(newEntry.name)) {
                      // send entry back to schema edit body
                      model.addField(newEntry);
                      Navigator.popUntil(context, ModalRoute.withName('/create_collection'));
                    } else {
                      // snackbar: field with same name exists
                      _showSnackbar(
                        'A field with this name already exists',
                        context,
                      );
                    }
                  } else {
                    // snackbar: please enter a field name
                    _showSnackbar(
                      'Please enter a field name',
                      context,
                    );
                  }
                },
              );
            },
          )
        ],
      ),
      body: Provider.value(
        value: newEntry,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: _getConfigurationForm(),
        ),
      ),
    );
  }

  Widget _getConfigurationForm() {
    return FieldConfigWidget();
  }

  _showSnackbar(String message, BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
