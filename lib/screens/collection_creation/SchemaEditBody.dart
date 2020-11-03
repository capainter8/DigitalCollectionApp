import 'package:DigitalCollectionApp/models/fields/field_model.dart' as f;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SchemaEditBody extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SchemaEditBodyState([
        f.FieldUtil.load(f.FieldType.TextField, "Test Field 1", "Field 1 value", required: true),
        f.FieldUtil.load(f.FieldType.TextField, "Test Field 2", "Field 2 value", required: false),
        f.FieldUtil.load(f.FieldType.DecimalField, "Test Field 3", 456.34, required: false),
      ]
    );
  }
}

class _SchemaEditBodyState extends State<SchemaEditBody> {

  List<f.Field> fields;
  f.Field selectedField;

  _SchemaEditBodyState(this.fields);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildFieldDataTable(context),
        _buildFieldControlBar()
      ]
    );
  }

  _onFieldSelected(bool selected, f.Field field) {
    setState(() {
      selectedField = field;
    });
  }

  Widget _buildFieldDataTable(BuildContext context) {

    if (fields.length == 0) {
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
    
    return Row(
      children: [
        Expanded(
          child: DataTable(
              showCheckboxColumn: false,
              headingRowColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                return Theme.of(context).colorScheme.primary;
              }),
              columns: [
                DataColumn(
                    label: Text("Label")
                ),
                DataColumn(
                    label: Text('Type')
                ),
                DataColumn(
                    label: Text('Required')
                )
              ],
              rows: _buildFieldDataTableRows(context)
          ),
        ),
      ],
    );
  }

  List<DataRow> _buildFieldDataTableRows(BuildContext context) {

    List<DataRow> rows = List<DataRow>();
    for (f.Field field in fields) {
      DataRow row = DataRow(
          color: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (selectedField == field) {
              return Theme.of(context).colorScheme.primary.withOpacity(0.2);
            }
            return null;
          }),
          onSelectChanged: (selected) {
            _onFieldSelected(selected, field);
          },
          cells: [
            DataCell(Text(field.name)),
            DataCell(Text(field.getReadableType())),
            DataCell(Text(_getRequiredString(field.required)))
          ]);
      rows.add(row);
    }
    return rows;
  }

  String _getRequiredString(bool required) {
    if (required) return 'Yes';
    return 'No';
  }
  
  Widget _buildFieldControlBar() {
    return Column(
    children: [
      _buildFloatingActionButton(),
      _buildControlBar()
    ]);
  }

  Widget _buildFloatingActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton.extended(
              onPressed: () {
                // Do something
              },
              label: Text('New Field'),
              icon: Icon(Icons.add)
          ),
        ),
      ],
    );
  }

  Widget _buildControlBar() {
    if (selectedField == null) return Container();
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: Icon(Icons.arrow_upward), onPressed: () {
              // Move the selected field up one
            }),
            IconButton(icon: Icon(Icons.arrow_downward), onPressed: () {
              // Move the selected field down one
            }),
            IconButton(icon: Icon(Icons.edit), onPressed: () {
              // Move the selected field down one
            }),
            IconButton(icon: Icon(Icons.delete), onPressed: () {
              setState(() {
                _removeSelectedField();
              });
            })
          ]
      ),
    );
  }

  void _removeSelectedField() {
    int index = fields.indexOf(selectedField);

    int next; // The index of the next field that will be selected
    if (index - 1 <= 0) {
      next = (index + 1) % fields.length;
    } else {
      next = (index - 1) % fields.length;
    }

    f.Field temp = fields.elementAt(next);
    fields.remove(selectedField);

    if (fields.length > 0) {
      selectedField = temp;
    } else {
      selectedField = null;
    }
  }
}