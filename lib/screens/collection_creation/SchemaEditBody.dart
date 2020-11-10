import 'package:DigitalCollectionApp/models/CreateCollectionModel.dart';
import 'package:DigitalCollectionApp/models/Schema.dart';
import 'package:DigitalCollectionApp/models/fields/field_model.dart' as f;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SchemaEditBody extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SchemaEditBodyState();
  }
}

class _SchemaEditBodyState extends State<SchemaEditBody> {

  _SchemaEditBodyState();

  @override
  Widget build(BuildContext context) {

    return Consumer<CreateCollectionModel> (
      builder: (context, model, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildFieldDataTableWrapper(context, model),
            _buildFieldControlBar(model)
          ]
        );
      }
    );
  }

  Widget _buildFieldDataTableWrapper(BuildContext context, CreateCollectionModel model) {

    if (model.getFields().length == 0) {
      return _buildNoFieldsWidget();
    }
    // If there are fields
    return Row(
        children: [
          Expanded(
              child: _buildFieldDataTable(context, model)
          )
        ]
    );
  }

  _buildNoFieldsWidget() {
    return Expanded (
      child: Align(
          alignment: Alignment.center,
          child: Text('Tap \'+\' to add a field', style: TextStyle(
              color: Colors.black38,
              fontStyle: FontStyle.italic
          ))
      ),
    );
  }

  _buildFieldDataTable(BuildContext context, CreateCollectionModel model) {
    return DataTable(
      showCheckboxColumn: false,
      headingRowColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return Theme.of(context).colorScheme.secondary;
      }),
      columns: _buildDataTableColumns(context),
      rows: _buildDataTableRows(context, model)
    );
  }

  _buildDataTableColumns(BuildContext context) {
    return [
      DataColumn(
          label: Text("Label")
      ),
      DataColumn(
          label: Text('Type')
      ),
      DataColumn(
          label: Text('Required')
      )
    ];
  }

  _buildDataTableRows(BuildContext context, CreateCollectionModel model) {

    List<DataRow> rows = List<DataRow>();
    for (SchemaEntry field in model.getFields()) {
      DataRow row = DataRow(
          color: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (model.selectedField == field) {
              return Theme.of(context).colorScheme.primary.withOpacity(0.2);
            }
            return null;
          }),
          onSelectChanged: (selected) {
            model.selectedField = field;
          },
          cells: [
            DataCell(Text(field.name)),
            DataCell(Text(f.fieldTypeToString(field.type))),
            DataCell(Text(_getRequiredString(field.required)))
          ]);
      rows.add(row);
    }
    return rows;
  }

  _getRequiredString(bool required) {
    if (required) return 'Yes';
    return 'No';
  }
  
  _buildFieldControlBar(CreateCollectionModel model) {
    return Column(
    children: [
      _buildFloatingActionButton(),
      _buildControlBar(model)
    ]);
  }

  _buildFloatingActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton.extended(
            heroTag: "btn1",
              onPressed: () {
                // Navigate to create field screen
                Navigator.pushNamed(context, '/create_collection/select_field_type');
              },
              label: Text('New Field'),
              icon: Icon(Icons.add)
          ),
        ),
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton.extended(
            heroTag: "btn2",
              onPressed: () {
                // Navigate to Template list screen
                Navigator.pushNamed(context, '/create_collection/listTemplates');
              },
              label: Text('View Templates'),
              icon:Icon(CupertinoIcons.eye_fill)
          ),
        ),
      ],
    );
  }

  _buildControlBar(CreateCollectionModel model) {
    if (model.selectedField == null) return Container();
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: Icon(Icons.arrow_upward), onPressed: () {
              model.moveSelectedFieldUp();
            }),
            IconButton(icon: Icon(Icons.arrow_downward), onPressed: () {
              model.moveSelectedFieldDown();
            }),
            IconButton(icon: Icon(Icons.edit), onPressed: () {
              // Move the selected field down one
            }),
            IconButton(icon: Icon(Icons.delete), onPressed: () {
              model.removeField(model.selectedField);
            })
          ]
      ),
    );
  }
}