import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qube_health_assignment/autolayou.dart';

import 'package:qube_health_assignment/views/widgets/datePickerView.dart';

class DateWidget extends StatelessWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final DateSelectionCallback? onDateSelected;
  final String? locale;

  DateWidget({
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    this.width,
    this.onDateSelected,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: width,
        margin: EdgeInsets.all(3.0.s),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0.s)),
          color: selectionColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0.s),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                  DateFormat("E", locale)
                      .format(date)
                      .substring(0, 2), // WeekDay
                  style: dayTextStyle),
              Text(date.day.toString(), // Date
                  style: dateTextStyle),
            ],
          ),
        ),
      ),
      onTap: () {
        if (onDateSelected != null) {
          onDateSelected!(this.date);
        }
      },
    );
  }
}
