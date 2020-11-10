import 'package:flutter/material.dart';


class stampTemplate extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _stampTemplate();
  }
}

class _stampTemplate extends State<stampTemplate> {
 
  @override
  Widget build(BuildContext context) {

     return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Stamp Template"),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  ),
              ],
            )
        ),
        body:
      Center(child:
       Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
       DataTable(
        columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Label',
          ),
        ),
        DataColumn(
          label: Text(
            'Type',
          ),
        ),
        DataColumn(
          label: Text(
            'Required',
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Type')),
            DataCell(Text('Text')),
            DataCell(Text('Yes')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(' ')),
            DataCell(Text('Text')),
            DataCell(Text('Yes')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Year/Era')),
            DataCell(Text('Text')),
            DataCell(Text('Yes')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Genre')),
            DataCell(Text('Text')),
            DataCell(Text('Yes')),
          ],
        ),

         DataRow(
          cells: <DataCell>[
            DataCell(Text('Edition')),
            DataCell(Text('Text')),
            DataCell(Text('No')),
          ],
        ),
      ],
    ),
    Padding(padding: EdgeInsets.all(5)),
    RaisedButton(onPressed:null,
    child:Text("Apply Template"),)
    
       ]
    ),
  
    ));
  }}
