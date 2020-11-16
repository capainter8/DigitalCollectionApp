import 'package:DigitalCollectionApp/models/CollectionViewerProxy.dart';
import 'package:DigitalCollectionApp/models/fields/Fields.dart';
import 'package:flutter/material.dart';

class FieldSortModal extends StatelessWidget {

  final CollectionViewerProxy proxy;
  FieldSortModal(this.proxy);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Sort By:", style: Theme.of(context).textTheme.headline5),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: proxy.schemaProxy.getEntryNames().length,
            itemBuilder: (ctx, index) {
              return ListTile(
                title: Text(
                    proxy.schemaProxy.getEntryNames()[index],
                style: TextStyle(
                  //fontWeight: FontWeight.bold
                ),
                ),
                onTap: () {
                  if (proxy.itemsProxy.length != 0) {
                    var entry = proxy.schemaProxy.getEntryFromIndex(index);
                    Field toSort = loadField(entry.type, entry.name, null);
                    proxy.sortByField(toSort);
                  }
                  Navigator.pop(context);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  _noItemsSnackBar() {
    return SnackBar(
      content: Text('No items to sort'),
    );
  }
}
