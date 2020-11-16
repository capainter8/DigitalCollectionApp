// import 'package:DigitalCollectionApp/models/Collection.dart';
// import 'package:DigitalCollectionApp/widgets/fields/FieldEditFormBuilder.dart';
// import 'package:flutter/material.dart';
//
// class CollectionItemInputScreen extends StatefulWidget {
//
//   final Collection collection;
//   final String pageTitle;
//   final bool createMode;
//
//   // Open form to create a new collection item
//   CollectionItemInputScreen.make(this.collection)
//       : this.pageTitle = "Create Item",
//         this.createMode = true;
//   /// Open the form as an editor with an existing collection
//   CollectionItemInputScreen.edit(this.collection)
//       : this.pageTitle = "Edit Item",
//         this.createMode = false;
//
//   @override
//   _CollectionItemInputScreenState createState() => _CollectionItemInputScreenState();
// }
//
// class _CollectionItemInputScreenState extends State<CollectionItemInputScreen> {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(this.widget.pageTitle),
//       ),
//       body: Column(
//         children: FieldEditFormBuilder.buildFieldEditorFormWidgets(this.widget.collection);
//       ),
//     );
//   }
// }
