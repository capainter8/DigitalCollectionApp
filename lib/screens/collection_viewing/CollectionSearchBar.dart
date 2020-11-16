import 'package:DigitalCollectionApp/models/CollectionViewerProxy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'FieldSortModal.dart';

class CollectionSearchBar extends StatefulWidget {
  @override
  _CollectionSearchBarState createState() => _CollectionSearchBarState();
}

class _CollectionSearchBarState extends State<CollectionSearchBar> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var proxy = Provider.of<CollectionViewerProxy>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: (query) {
                proxy.searchFilter(query);
              },
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(8.0),
                //labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {
              showFields(context, proxy);
            },
          ),
        ],
      ),
    );
  }

  showFields(BuildContext context, CollectionViewerProxy proxy) {
    showModalBottomSheet(
      context: context,
      builder: (context) => FieldSortModal(proxy),
    );
  }
}
