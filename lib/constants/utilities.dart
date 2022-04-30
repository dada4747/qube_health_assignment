import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'appicon.dart';

String convertTotime(String date) {
  final time = DateTime.parse(date);
  final intTime = int.parse(time.hour.toString());
  //print(int.parse(time.toLocal().toString()));
  if (intTime >= 17 && intTime <= 20) {
    return "4 PM - 6 PM";
  } else if (intTime >= 21 && intTime <= 24) {
    return '7 PM - 12 AM';
  } else if (intTime >= 1 && intTime <= 4) {
    return '1 AM - 4 AM ';
  } else if (intTime >= 5 && intTime <= 8) {
    return '5 AM - 8 AM';
  } else if (intTime >= 9 && intTime <= 12) {
    return '9 AM - 12 AM';
  } else if (intTime >= 13 && intTime <= 16) {
    return '1 PM - 4 PM';
  }
  return '';
}

DateFormatter(String createdAt) {
  DateTime todayDate = DateTime.parse(createdAt);

  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(todayDate);
  var date = DateTime.parse(formatted); // (year)

  return date;
}

bool isDisable(String energetic) {
  if (int.parse(energetic) > 0) {
    return false;
  } else {
    return true;
  }
}

AssetImage setMoodIcon(String s) {
  if (s == "Calm") {
    return AppIcon.calm;
  } else if (s == "Bored") {
    return AppIcon.bored;
  } else if (s == "Happy") {
    return AppIcon.happy;
  } else {
    return AppIcon.sad;
  }
}

String getUrlToId(String? youtubeUrl) {
  String? videoId;
  videoId = YoutubePlayer.convertUrlToId(youtubeUrl!);
  return videoId!;
}
