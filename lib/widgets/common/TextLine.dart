import 'package:flutter/material.dart';

class TextLine extends StatelessWidget {

  Widget child;
  TextLine({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: this.child)
      ],
    );
  }
}
