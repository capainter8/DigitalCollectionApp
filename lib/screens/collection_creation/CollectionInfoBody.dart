import 'package:flutter/material.dart';

class CollectionInfoBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CollectionInfoBodyState();
  }
}

class _CollectionInfoBodyState extends State<CollectionInfoBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Collection Name"),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            maxLines: 1,
            autocorrect: false,
          ),
        ),
        Text("Description"),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            maxLines: 10,
            autocorrect: false,
          ),
        ),
      ],
    );
  }
}