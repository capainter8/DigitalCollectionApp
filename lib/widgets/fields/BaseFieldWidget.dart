import 'package:flutter/material.dart';

class BaseField extends StatelessWidget {

  final String name;
  final Widget child;

  const BaseField(
      this.name,
      this.child
  ) : assert(name != null, child != null);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                this.name,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 11
                )
              ),
              this.child
            ]
          ),
        ),
      ],
    );
  }
}