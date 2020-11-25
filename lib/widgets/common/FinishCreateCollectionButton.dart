import 'package:DigitalCollectionApp/models/CreateCollectionModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FinishCreateCollectionButton extends StatelessWidget {
  FinishCreateCollectionButton();

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('FINISH'),
      onPressed: () {
        var model = Provider.of<CreateCollectionModel>(context, listen: false);
        if (model.fields.length < 1) {
          var scaffold = Scaffold.of(context);
          scaffold.showSnackBar(SnackBar(
            content: Text("Must create at least one field"),
          ));
        } else {
          Provider.of<CreateCollectionModel>(context, listen: false)
              .commitCollection();
          Navigator.popUntil(context, ModalRoute.withName('/'));
        }
      },
    );
  }
}
