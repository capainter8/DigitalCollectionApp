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
        elevation: 0.0,
        title: Text("Collections"),
      ),
      drawer: Drawer(),
      body: CollectionListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add)
      )
    );
  }
}