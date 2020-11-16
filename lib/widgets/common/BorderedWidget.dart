import 'package:flutter/material.dart';

class BorderedWidget extends StatelessWidget {

  final Widget child;
  final double radius;
  final double width;
  final Color color;
  final EdgeInsets padding;

  BorderedWidget({
    @required this.child,
    radius,
    width,
    color,
    padding })
      : this.padding = padding ?? EdgeInsets.all(8.0),
        this.radius = 8.0,
        this.width = 1.0,
        this.color = Colors.black54;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: this.padding,
      decoration: BoxDecoration(
        border: Border.all(
          color: this.color,
          width: this.width
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(this.radius)
        ),
      ),
      child: this.child,
    );
  }
}
