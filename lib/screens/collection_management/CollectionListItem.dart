import 'package:DigitalCollectionApp/screens/collection_management/CollectionListItemPopupMenu.dart';
import 'package:flutter/material.dart';
import '../../models/Collection.dart';

class CollectionListItem extends StatelessWidget {

  final Collection collection;
  CollectionListItem({@required this.collection});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible (
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: [
                  Text(
                      collection.getName(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      )),
                  Text(collection.getDescription()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Created on July 15, 2019"),
                      Text("23 Item(s)")
                    ]
                  )
                ],
              )
          ),
          Container(
            child: CollectionListPopupMenu()
          ),
        ],
      )
    );
  }
}