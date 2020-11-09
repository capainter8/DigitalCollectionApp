import 'package:DigitalCollectionApp/models/CreateCollectionModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollectionInfoBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CollectionInfoBodyState();
  }
}

class _CollectionInfoBodyState extends State<CollectionInfoBody> {

  final _nameInputController = TextEditingController();
  final _descriptionInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
          child: Row(
            children: [
              Expanded (
                child: Text(
                  "Describe the collection",
                  style: Theme.of(context).textTheme.headline6
                ),
              ),
            ],
          )
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
          child: TextField(
            controller: _nameInputController,
            onEditingComplete: () {
              Provider.of<CreateCollectionModel>(context).collectionName = _nameInputController.text;
            },
            maxLines: 1,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: 'Collection name',
              border: OutlineInputBorder()
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
          child: TextField(
            controller: _descriptionInputController,
            onEditingComplete: () {
              Provider.of<CreateCollectionModel>(context).collectionDescription = _descriptionInputController.text;
            },
            maxLines: 10,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: 'description',
              border: OutlineInputBorder()
            ),
          ),
        ),
      ],
    );
  }
}