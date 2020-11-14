import 'package:flutter/material.dart';
import 'package:DigitalCollectionApp/models/fields/Fields.dart';

class FieldTypeSelectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Field Type'),
      ),
      body: FieldTypeSelect()
    );
  }
}

class FieldTypeSelect extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return _buildListTile(
            context,
            FieldType.values.elementAt(index)
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: FieldType.values.length
    );
  }

  Widget _buildListTile(BuildContext context, FieldType type) {
    return ListTile(
      leading: Icon(Icons.image),
      title: Text(fieldTypeToString(type)),
      onTap: () => onListTileTapped(context, type),
    );
  }

  void onListTileTapped(BuildContext context, FieldType type) {
    Navigator.pushNamed(
      context,
      '/create_collection/field_configuration',
      arguments: type
    );
  }
}