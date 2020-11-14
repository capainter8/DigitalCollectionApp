import 'package:DigitalCollectionApp/widgets/common/BorderedWidget.dart';
import 'package:flutter/material.dart';

class DateInputLine extends StatelessWidget {

  DateTime date;
  double borderRadius;
  var onPressed;
  DateInputLine({@required date});

  @override
  Widget build(BuildContext context) {
    return BorderedWidget(
      child: Row(
        children: [
          Text(date.toString()),
          // TODO: Finish this
        ],
      )
    );
  }
}
