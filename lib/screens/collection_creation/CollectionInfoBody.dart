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

    CreateCollectionModel _model = Provider.of<CreateCollectionModel>(context, listen: false);

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
            onChanged: (value) {
              _model.collectionName = value;
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
            onChanged: (value) {
              _model.collectionDescription = value;
            },
            minLines: 3,
            maxLines: 5,
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