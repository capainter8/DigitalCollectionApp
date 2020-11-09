import 'package:DigitalCollectionApp/models/CreateCollectionModel.dart';
import 'package:DigitalCollectionApp/screens/collection_creation/CollectionInfoBody.dart';
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

    _onFinishPressed() {
      // Set the collection name and description
      Provider.of<CreateCollectionModel>(context, listen: false).commitCollection();
      Navigator.popUntil(context, ModalRoute.withName('/'));
    }

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
              ),
            actions: [
              FlatButton(
                child: Text('FINISH'),
                onPressed: _onFinishPressed,
              )
            ],
          ),
          body: TabBarView(
            children: [
              CollectionInfoBody(),
              SchemaEditBody()
            ],
          )
      ),
    );
  }
}