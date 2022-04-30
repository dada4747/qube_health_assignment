import 'package:flutter/material.dart';
import 'package:qube_health_assignment/autolayou.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../Model/UserFeelingModel.dart';
import '../../constants/appcolor.dart';
import '../../constants/utilities.dart';

class YouTubeVideosList extends StatelessWidget {
  const YouTubeVideosList({
    Key? key,
    required this.vdoArray,
  }) : super(key: key);

  final List<VideoArr> vdoArray;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.0.s,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: vdoArray.length,
          itemBuilder: (BuildContext context, int index) => Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(
                      left: 22.0.s, bottom: 22.0.s, top: 10.0.s),
                  width: 208.0.s,
                  height: 128.0.s,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.shadowColor,
                            blurRadius: 20.0.s,
                            offset: Offset(4.0.s, 4.0.s))
                      ],
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10.0.s))),
                  child: YoutubePlayer(
                    controller: YoutubePlayerController(
                        initialVideoId: getUrlToId(vdoArray[index].youtubeUrl),
                        flags: const YoutubePlayerFlags(
                          autoPlay: false,
                          mute: true,
                        )),
                    showVideoProgressIndicator: false,
                    progressIndicatorColor: Colors.cyanAccent,
                  ),
                ),
              )),
    );
  }
}
