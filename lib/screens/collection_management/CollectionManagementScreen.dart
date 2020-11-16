import 'package:DigitalCollectionApp/models/Collection.dart';
import 'package:DigitalCollectionApp/screens/collection_viewing/CollectionViewScreen.dart';
import 'package:flutter/material.dart';
import 'CollectionListView.dart';

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
        title: Row(
          children: [
            Text("Collections"),
          ],
        ),
      ),
      body: CollectionListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/create_collection');
        },
      ),
    );
  }
}
