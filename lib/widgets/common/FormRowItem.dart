import 'package:flutter/material.dart';

class FormRowItem extends StatelessWidget {

  List<Widget> children;
  double spacing;
  CrossAxisAlignment alignment;
  FormRowItem({@required this.children, this.spacing = 12.0, this.alignment = CrossAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: this.spacing),
      child: Column(
        crossAxisAlignment: this.alignment,
        children: this.children,
      )
    );
  }
}
