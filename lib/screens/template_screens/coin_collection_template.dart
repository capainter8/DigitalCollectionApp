import 'package:flutter/material.dart';


class currencyTemplate extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _currencyTemplate();
  }
}

class _currencyTemplate extends State<currencyTemplate> {
 
  @override
  Widget build(BuildContext context) {

     return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Coin Collection Template"),
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
            DataCell(Text('Year')),
            DataCell(Text('Text')),
            DataCell(Text('Yes')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Value')),
            DataCell(Text('Text')),
            DataCell(Text('Yes')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Mint Mark')),
            DataCell(Text('Text')),
            DataCell(Text('No')),
          ],
        ),

         DataRow(
          cells: <DataCell>[
            DataCell(Text('Composition')),
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
