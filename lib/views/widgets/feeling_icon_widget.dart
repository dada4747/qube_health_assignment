import 'package:flutter/material.dart';
import 'package:qube_health_assignment/autolayou.dart';
import 'package:qube_health_assignment/constants/appcolor.dart';

class FeelingIconWidget extends StatelessWidget {
  final AssetImage moodIcon;
  final String? persent;
  final bool isDisable;
  final String type;
  const FeelingIconWidget(
      {required this.moodIcon,
      this.persent,
      required this.isDisable,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40.0.s,
            height: 80.0.s,
            decoration: BoxDecoration(
              color: AppColors.feelingwidget,
              boxShadow: [
                BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 20.0.s,
                    offset: Offset(4.0.s, 4.0.s))
              ],
              borderRadius: BorderRadius.all(Radius.circular(20.0.s)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 14.0.s,
                    margin: EdgeInsets.only(
                      top: 16.0.s,
                    ),
                    child: Text(
                      isDisable ? " " : '$persent%',
                      style: TextStyle(
                          fontFamily: "SFPro",
                          fontSize: 12.0.s,
                          fontWeight: FontWeight.w200),
                      textAlign: TextAlign.center,
                    )),
                Container(
                  width: 40.0.s,
                  height: 40.0.s,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.green),
                  child: Center(
                    child: Container(
                      width: 20.0.s,
                      height: 20.0.s,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: moodIcon,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4.0.s),
            height: 14.0.s,
            child: Text(
              type,
              style: TextStyle(fontFamily: "SFPro", fontSize: 12.0.s),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
      isDisable
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40.0.s,
                  height: 80.0.s,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(197, 250, 247, 247),
                    borderRadius: BorderRadius.all(Radius.circular(20.0.s)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4.0.s),
                  width: 47.0.s,
                  height: 14.0.s,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(197, 250, 247, 247),
                  ),
                )
              ],
            )
          : const SizedBox(),
    ]);
  }
}
