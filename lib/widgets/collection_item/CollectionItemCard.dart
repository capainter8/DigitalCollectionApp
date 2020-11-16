import 'package:DigitalCollectionApp/models/Collection.dart';
import 'package:DigitalCollectionApp/models/CollectionItem.dart';
import 'package:DigitalCollectionApp/models/Schema.dart';
import 'package:DigitalCollectionApp/widgets/fields/field_display_widgets/FieldWidgetBuilder.dart';
import 'package:flutter/material.dart';
import 'package:DigitalCollectionApp/models/fields/Fields.dart';
import 'package:provider/provider.dart';

enum PopupOptions { edit, delete }

class CollectionItemCard extends StatelessWidget {

  final CollectionItem item;
  CollectionItemCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(children: buildFieldWidgets()),
          ),
          Column(
            children: [
              _popupMenu(context, this.item),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> buildFieldWidgets() {
    List<Widget> widgets = List<Widget>();

    Schema schema = item.schema;
    List<String> keys = schema.getEntryNames();
    for (var key in keys) {
      Field field = item.getField(key);
      widgets.add(FieldWidgetBuilder.build(field));
    }

    return widgets;
  }

  _popupMenu(BuildContext context, CollectionItem item) {
    return PopupMenuButton(
      onSelected: (PopupOptions result) {
        switch (result) {
          case PopupOptions.edit:
            // TODO: implement editing
            break;
          case PopupOptions.delete:
            _showDeleteConfirmation(context, item);
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<PopupOptions>>[
        const PopupMenuItem<PopupOptions>(
          value: PopupOptions.edit,
          child: Text("Edit"),
        ),
        const PopupMenuItem<PopupOptions>(
          value: PopupOptions.delete,
          child: Text("Delete"),
        ),
      ],
    );
  }

  _showDeleteConfirmation(BuildContext context, CollectionItem item) {
    var alertDialog = AlertDialog(
      title: Text(
        'Delete this item?',
        textAlign: TextAlign.center,
      ),
      actions: [
        FlatButton(
            child: Text('CANCEL'),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        FlatButton(
          child: Text('DELETE'),
          onPressed: () {
            Collection collection =
                Provider.of<Collection>(context, listen: false);
            collection.removeItem(item);
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }
}
