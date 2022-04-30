import 'package:flutter/material.dart';
import 'package:qube_health_assignment/autolayou.dart';

import '../../Model/UserFeelingModel.dart';

class VideoDescriptionWidget extends StatelessWidget {
  const VideoDescriptionWidget({
    Key? key,
    required this.vdoArray,
  }) : super(key: key);

  final List<VideoArr> vdoArray;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0.s,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: vdoArray.length,
          itemBuilder: ((context, index) {
            return Container(
              padding: EdgeInsets.only(
                top: 10.0.s,
                left: 22.0.s,
                right: 42.0.s,
                // bottom: 10.0.s,
              ),
              margin: EdgeInsets.all(8.0.s),
              width: 352.0.s,
              height: 180.0.s,
              child: Text(
                vdoArray[index].description!,
                style: TextStyle(
                  fontFamily: "SFPro",
                  fontSize: 14.0.s,
                  fontWeight: FontWeight.w100,
                  // height: 18.0.s,
                ),
                textAlign: TextAlign.left,
              ),
            );
          })),
    );
  }
}
