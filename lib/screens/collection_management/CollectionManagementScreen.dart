import 'package:flutter/material.dart';
import 'CollectionListView.dart';
import 'package:DigitalCollectionApp/services/Dialogs.dart';
import 'package:provider/provider.dart';
import 'package:DigitalCollectionApp/services/Auth.dart';

class CollectionManagementScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CollectionManagementScreen();
  }
}

class _CollectionManagementScreen extends State<CollectionManagementScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Collections"),
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
      drawer: Drawer(child: ListView(
        padding: EdgeInsets.zero,
      children: <Widget>[ 
        ListTile(
        title: Text('Sign Out'),
        onTap: () {

          context.read<Auth>().logout();
         
        })
      ]
      )),
      body: CollectionListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
         onPressed: () {
                Dialogs.confirmation(context, "Create new collection?");
              }

      )
    );
  }
}