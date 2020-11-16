import 'package:flutter/material.dart';

class TextLine extends StatelessWidget {

  String text;
  Color color;
  FontStyle fontStyle;
  TextAlign textAlign;

  TextLine(this.text, {this.color, this.fontStyle, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            this.text,
            style: TextStyle(
              color: this.color,
              fontStyle: this.fontStyle,
            ),
            textAlign: this.textAlign,
          ),
        )
      ],
    );
  }
}
