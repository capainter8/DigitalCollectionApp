import 'package:DigitalCollectionApp/models/fields/FieldType.dart';
import 'package:flutter/material.dart';
import 'package:DigitalCollectionApp/models/fields/field_model.dart' as f;

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
            f.FieldType.values.elementAt(index)
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: f.FieldType.values.length - 1
    );
  }

  Widget _buildListTile(f.FieldType type) {
    f.Field tmp = f.FieldUtil.load(type, null, null);
    return ListTile(
      leading: Icon(Icons.image),
      title: Text(fieldTypeToString(tmp.getType())),
      onTap: () => onListTileTapped(type),
    );
  }

  void onListTileTapped(f.FieldType type) {

  }
}