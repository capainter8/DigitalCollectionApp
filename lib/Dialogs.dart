import 'package:flutter/material.dart';
import 'package:DigitalCollectionApp/SecondPage.dart';

class Dialogs
{

  static _confirm(bool isYes, BuildContext context)
  {
     if(isYes)
     {
       Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondPage()),
       );
     }

      else{
          Navigator.pop(context);
      }
  }




  static confirmation(BuildContext context, String title)
  {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(title),
          actions: [
            FlatButton(
              child: Text("Cancel"),
              onPressed: () {
                 _confirm(false, context);
              }
            ),
            FlatButton(
              child: Text("Confirm"),
              onPressed: () {
                _confirm(true, context);
              },
              )   
          ],

        );




      }
    
    
    
    );
    
  }
}