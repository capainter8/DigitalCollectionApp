import 'package:flutter/material.dart';
import 'CollectionListView.dart';
import 'package:DigitalCollectionApp/Dialogs.dart';

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
      drawer: Drawer(),
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