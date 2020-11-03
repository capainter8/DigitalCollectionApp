import 'package:DigitalCollectionApp/models/CreateCollectionModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateFieldScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _CreateFieldScreenState();
  }
}

class _CreateFieldScreenState extends State<CreateFieldScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<CreateCollectionModel>(
      builder: (context, model, child) {
        return Text(model.getFields().length.toString());
      }
    );
  }

}