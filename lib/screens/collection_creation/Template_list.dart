import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TemplateScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _TemplateScreen();
  }
}

class _TemplateScreen extends State<TemplateScreen> {
 

  @override
  Widget build(BuildContext context) {

     return 
    Scaffold(
      appBar: AppBar(
        title: Text("Templates"),
      ),
  body:ListView(
  children: <Widget>[
    ListTile(
      leading: Icon(CupertinoIcons.money_dollar),
      title: Text('Coin Collection Template'),
      onTap: (){
         Navigator.pushNamed(context, '/currencycollection');
      },
    ),
    ListTile(
      leading: Icon(CupertinoIcons.book),
      title: Text('Book Collection Template'),
      onTap: (){
           Navigator.pushNamed(context, '/bookcollection');
      },
    ),
    ListTile(
      leading: Icon(CupertinoIcons.envelope),
      title: Text('Stamp Collection Template'),
      onTap: (){
            Navigator.pushNamed(context, '/stampcollection');
      },
    ),
  ],
));   
  }

}
