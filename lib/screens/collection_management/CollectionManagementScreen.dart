import 'package:flutter/material.dart';
import '../../services/CollectionDatabase.dart';
import '../../models/Collection.dart';
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
        title: Text("Collections"),
      ),
      drawer: Drawer(),
      body: CollectionListView(),
    );
  }
}