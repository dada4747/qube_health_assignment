import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qube_health_assignment/autolayou.dart';

import '../../constants/appcolor.dart';

class CalendarDate extends StatelessWidget {
  const CalendarDate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.only(
          top: 10.0.s,
          left: 20.0.s,
        ),
        width: 120.0.s,
        height: 24.0.s,
        decoration: BoxDecoration(
            color: AppColors.dateBackColor,
            borderRadius: BorderRadius.circular(5.0.s)),
        child: Center(
          child: Text(
            DateFormat('dd MMM, yyyy').format(DateTime.now()),
            style: TextStyle(
              fontFamily: "SFPro",
              fontWeight: FontWeight.w100,
              fontSize: 18.0.s,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
