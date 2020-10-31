import 'package:flutter/material.dart';
import 'package:editable/editable.dart';

class FieldScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FieldScreen();
  }
}

class _FieldScreen extends State<FieldScreen> {

//row data
List rows = [
     {"name": ' '}, 
   
   
 ];
//Headers or Columns
List headers = [
   {"title":'Label', 'widthFactor': 0.33,"index": 1, "key":'name'},
   {"title":'Description', 'widthFactor': 0.33,'index': 2, 'key':'name'},
  {"title":'Type', 'widthFactor': 0.33,'index': 3, 'key':'name'},
 ];




  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Add Items with fields"),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: ImageIcon(
                AssetImage('assets/images/icon.png'),
                color: Color(0xAAFFFFFF)
              ),
            )
          ],
        )
      ),


    body: Editable(
       columns: headers, 
       rows: rows,
       showCreateButton: true,
       tdStyle: TextStyle(fontSize: 20),
       showSaveIcon: true, //set true
        borderColor: Colors.grey.shade300,
        onSubmitted: (value){
         print(value);
        },
        onRowSaved: (value){ //added line
         print(value); //prints to console
        }, 
      ),
    );
   
  }
}