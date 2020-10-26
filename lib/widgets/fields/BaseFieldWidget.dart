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
    return Column(
      children: [
        Text(this.name,
        style: TextStyle(color: Colors.black12)),
        this.child
      ],
    );
  }
}