class FeelingModel {
  late String status;
  late Data data;

  FeelingModel({required this.status, required this.data});

  FeelingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = (json['data'] != null ? Data.fromJson(json['data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  late FeelingPercentage feelingPercentage;
  late List<FeelingList> feelingList;
  late List<VideoArr> videoArr;

  Data(
      {required this.feelingPercentage,
      required this.feelingList,
      required this.videoArr});

  Data.fromJson(Map<String, dynamic> json) {
    feelingPercentage = (json['feeling_percentage'] != null
        ? FeelingPercentage.fromJson(json['feeling_percentage'])
        : null)!;
    if (json['feeling_list'] != null) {
      feelingList = <FeelingList>[];
      json['feeling_list'].forEach((v) {
        feelingList.add(FeelingList.fromJson(v));
      });
    }
    if (json['video_arr'] != null) {
      videoArr = <VideoArr>[];
      json['video_arr'].forEach((v) {
        videoArr.add(VideoArr.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.feelingPercentage != null) {
      data['feeling_percentage'] = this.feelingPercentage.toJson();
    }
    if (this.feelingList != null) {
      data['feeling_list'] = this.feelingList.map((v) => v.toJson()).toList();
    }
    if (this.videoArr != null) {
      data['video_arr'] = this.videoArr.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FeelingPercentage {
  late String? happy;
  late String? sad;
  late String? energetic;
  late String? calm;
  late String? angry;
  late String? bored;

  FeelingPercentage(
      {this.happy,
      this.sad,
      this.energetic,
      this.calm,
      this.angry,
      this.bored});

  FeelingPercentage.fromJson(Map<String, dynamic> json) {
    happy = json['Happy'];
    sad = json['Sad'];
    energetic = json['Energetic'];
    calm = json['Calm'];
    angry = json['Angry'];
    bored = json['Bored'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Happy'] = this.happy;
    data['Sad'] = this.sad;
    data['Energetic'] = this.energetic;
    data['Calm'] = this.calm;
    data['Angry'] = this.angry;
    data['Bored'] = this.bored;
    return data;
  }
}

class FeelingList {
  late String? userFeelingId;
  late String? feelingId;
  late String? feelingName;
  late String? submitTime;

  FeelingList(
      {required this.userFeelingId,
      required this.feelingId,
      required this.feelingName,
      required this.submitTime});

  FeelingList.fromJson(Map<String, dynamic> json) {
    userFeelingId = json['user_feeling_id'];
    feelingId = json['feeling_id'];
    feelingName = json['feeling_name'];
    submitTime = json['submit_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_feeling_id'] = this.userFeelingId;
    data['feeling_id'] = this.feelingId;
    data['feeling_name'] = this.feelingName;
    data['submit_time'] = this.submitTime;
    return data;
  }
}

class VideoArr {
  late String? title;
  late String? description;
  late String? youtubeUrl;

  VideoArr({this.title, this.description, this.youtubeUrl});

  VideoArr.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    youtubeUrl = json['youtube_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['youtube_url'] = this.youtubeUrl;
    return data;
  }
}
