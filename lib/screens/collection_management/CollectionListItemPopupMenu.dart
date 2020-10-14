import 'package:flutter/material.dart';

enum PopupOptions {edit, export, delete}

class CollectionListPopupMenu extends StatelessWidget {

  PopupOptions _selection;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return PopupMenuButton(
        onSelected: (PopupOptions result) { _selection = result; },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<PopupOptions>>[
          const PopupMenuItem<PopupOptions> (
              value: PopupOptions.edit,
              child: Text("Edit")
          ),
          const PopupMenuItem<PopupOptions> (
          value: PopupOptions.export,
          child: Text("Export")
          ),
          const PopupMenuItem<PopupOptions> (
          value: PopupOptions.delete,
          child: Text("Delete")
          )]
    );
  }

}