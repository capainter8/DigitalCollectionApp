import 'package:flutter/material.dart';

class BorderedWidget extends StatelessWidget {

  Widget child;
  double radius;
  double width;
  Color color;
  EdgeInsets padding;
  BorderedWidget({@required this.child,
    radius = 12.0,
    width = 1.0,
    color = Colors.black54,
    padding = const EdgeInsets.all(8.0)
  });

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
    );
  }
}
