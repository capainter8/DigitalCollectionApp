import 'package:DigitalCollectionApp/models/CreateCollectionModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SchemaEditBody.dart';

class CollectionCreationScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _CollectionCreationScreenState();
  }
}

class _CollectionCreationScreenState extends State<CollectionCreationScreen> {

  _CollectionCreationScreenState() {}

  @override
  Widget build(BuildContext context) {

    return _buildTabController();
  }

  Widget _buildTabController() {
    return DefaultTabController (
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              title: Text('Create Collection'),
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Info'),
                  Tab(text: 'Fields')
                ],
              )
          ),
          body: TabBarView(
            children: [
              Text('Collection Info Screen'),
              SchemaEditBody()
            ],
          )
      ),
    );
  }
}