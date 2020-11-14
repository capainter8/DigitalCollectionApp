import 'package:flutter/material.dart';

class StringLabel extends StatelessWidget {

  final String label;
  StringLabel(this.label);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text( this.label,
                style: TextStyle(color: Colors.black87),
              ),
            )
        )
      ],
    );
  }
}
