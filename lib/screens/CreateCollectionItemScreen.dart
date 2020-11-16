import 'package:DigitalCollectionApp/models/Collection.dart';
import 'package:DigitalCollectionApp/models/CollectionItem.dart';
import 'package:DigitalCollectionApp/models/fields/Fields.dart';
import 'package:DigitalCollectionApp/widgets/common/TextLine.dart';
import 'package:DigitalCollectionApp/widgets/fields/FieldEditFormBuilder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateCollectionItemScreen extends StatefulWidget {

  static final String route = 'view_collection/create_item';

  FormFieldsModel formModel;

  @override
  _CreateCollectionItemScreenState createState() => _CreateCollectionItemScreenState();
}

class _CreateCollectionItemScreenState extends State<CreateCollectionItemScreen> {

  @override
  Widget build(BuildContext context) {

    final Collection collection = ModalRoute.of(context).settings.arguments;
    final List<Widget> formItems = FieldEditFormBuilder.buildFieldEditorFormWidgets(collection.schema);
    final FormFieldsModel formModel = FormFieldsModel(collection);

    return Provider(
      create: (context) => formModel,
      child: Scaffold(
        appBar: _buildAppBar(formModel),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(12.0),
                children: [
                  _requiredTextMessage(),
                  Column(
                    children: formItems
                  )
                ]
              ),
            ),
          ],
        )
      )
    );
  }

  _requiredTextMessage() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextLine('* field is required', color: Colors.black54, fontStyle: FontStyle.italic,),
    );
  }

  _buildAppBar(FormFieldsModel formModel) {
    return AppBar(
      title: Text('New Collection Item'),
        actions: [
          FlatButton(
            child: Text('FINISH'),
            onPressed: () {
              formModel.commit();
              Navigator.pop(context);
            },
          )
        ],
    );
  }
}

class FormFieldsModel {

  Map<String, dynamic> formEntries;
  Collection collection;

  FormFieldsModel(this.collection)
      : formEntries = new Map();

  void setField(String fieldName, dynamic value) {
    formEntries[fieldName] = value;
  }

  void commit() {
    CollectionItem item = collectionItemFromFormEntries();
    collection.add(item);
  }

  CollectionItem collectionItemFromFormEntries() {
    CollectionItem newItem = CollectionItem(this.collection.schema);
    this.collection.schema.getEntries().forEach((entry) {
      Field field = loadField(entry.type, entry.name, formEntries[entry.name]);
      newItem.addField(field);
    });
    return newItem;
  }
}
