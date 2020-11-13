import 'package:DigitalCollectionApp/models/CollectionItem.dart';
import 'package:DigitalCollectionApp/models/Schema.dart';
import 'package:DigitalCollectionApp/models/fields/field_model.dart' as f;
import 'package:DigitalCollectionApp/widgets/fields/field_display_widgets/FieldWidgetBuilder.dart';
import 'package:flutter/material.dart';

class CollectionItemCard extends StatelessWidget {

  final CollectionItem item;
  CollectionItemCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column (
        children: buildFieldWidgets()
      )
    );
  }

  List<Widget> buildFieldWidgets() {

    List<Widget> widgets = List<Widget>();

    Schema schema = item.schema;
    List<String> keys = schema.getEntryNames();
    for (var key in keys) {
      f.Field field = item.getField(key);
      widgets.add(FieldWidgetBuilder.build(field));
    }

    return widgets;
  }
}