import 'package:flutter/material.dart';
import 'package:qube_health_assignment/autolayou.dart';

class FeelingListWidget extends StatelessWidget {
  final AssetImage mood;
  final String feelingTime;
  final String moodType;
  const FeelingListWidget({
    Key? key,
    required this.feelingTime,
    required this.mood,
    required this.moodType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22.0.s, top: 16.0.s, bottom: 16.0.s),
      child: Row(
        children: [
          Text(feelingTime),
          SizedBox(
            width: 35.0.s,
          ),
          Row(
            children: [
              Container(
                width: 20.0.s,
                height: 20.0.s,
                decoration: BoxDecoration(

                    // shape: BoxShape.circle,
                    image: DecorationImage(
                  image: mood,
                )),
              ),
              SizedBox(
                width: 4.0.s,
              ),
              Text(moodType)
            ],
          ),
        ],
      ),
    );
  }
}
