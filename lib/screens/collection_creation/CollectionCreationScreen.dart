import 'package:DigitalCollectionApp/screens/collection_creation/CollectionInfoBody.dart';
import 'package:DigitalCollectionApp/widgets/common/FinishCreateCollectionButton.dart';
import 'package:flutter/material.dart';

import 'SchemaEditBody.dart';

class CollectionCreationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CollectionCreationScreenState();
  }
}

class _CollectionCreationScreenState extends State<CollectionCreationScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create Collection'),
          bottom: TabBar(
            tabs: [Tab(text: 'Info'), Tab(text: 'Fields')],
          ),
          actions: [
            FinishCreateCollectionButton(),
          ],
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: TabBarView(
            children: [
              CollectionInfoBody(),
              SchemaEditBody(),
            ],
          ),
        ),
      ),
    );
  }
}
