import 'package:DigitalCollectionApp/models/Collection.dart';
import 'package:DigitalCollectionApp/services/CollectionManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//enum PopupOptions { edit, export, delete }
enum PopupOptions { delete }

class CollectionListPopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Collection collection = Provider.of<Collection>(context, listen: false);

    return PopupMenuButton(
      onSelected: (PopupOptions result) {
        switch (result) {
          case PopupOptions.delete:
            _showAlertDialog(context, collection);
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<PopupOptions>>[
        // const PopupMenuItem<PopupOptions>(
        //   value: PopupOptions.edit,
        //   child: Text("Edit"),
        // ),
        // const PopupMenuItem<PopupOptions>(
        //   value: PopupOptions.export,
        //   child: Text("Export"),
        // ),
        const PopupMenuItem<PopupOptions>(
          value: PopupOptions.delete,
          child: Text("Delete"),
        ),
      ],
    );
  }

  _showAlertDialog(BuildContext context, Collection collection) {
    var alertDialog = AlertDialog(
      title: Text(
        'Delete this collection?',
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
            CollectionManager.instance.deleteCollection(collection);
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
