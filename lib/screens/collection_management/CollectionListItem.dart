import 'package:DigitalCollectionApp/screens/collection_management/CollectionListItemPopupMenu.dart';
import 'package:DigitalCollectionApp/screens/collection_viewing/CollectionViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/Collection.dart';

class CollectionListItem extends StatelessWidget {
  final Collection collection;
  CollectionListItem(this.collection);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CollectionViewScreen.route,
            arguments: this.collection);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    collection.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(collection.description),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Created on " + formatDate(collection.creationDate)),
                      Text("${collection.items.length} Item(s)"),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: ChangeNotifierProvider.value(
                value: collection,
                child: CollectionListPopupMenu(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(DateTime date) {
    return DateFormat.yMMMMd('en_US').format(date);
  }
}
