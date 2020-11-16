import 'package:flutter/material.dart';

class IntegerInputLine extends StatefulWidget {
  @override
  _IntegerInputLineState createState() => _IntegerInputLineState();
}

class _IntegerInputLineState extends State<IntegerInputLine> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
          )
        ),
      ],
    );
  }
}
