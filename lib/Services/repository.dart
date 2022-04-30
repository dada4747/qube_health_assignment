import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Model/UserFeelingModel.dart';

class ActivityRepository {
  final ActivityService _activityService = ActivityService();
  Future<FeelingModel?> getActivity() async {
    try {
      final _apiResponse = await _activityService.createAlbum();
      if (_apiResponse.statusCode == 200) {
        return FeelingModel.fromJson(jsonDecode(_apiResponse.body));
      }
      return null;
    } catch (e) {
      throw Exception();
    }
  }
}

class ActivityService {
  Future<http.Response> createAlbum() async {
    final response = await http.post(
      Uri.parse(
          'https://www.qubehealth.com/qube_services/api/testservice/getListOfUserFeeling'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-Api-Key': 'f6d646a6c2f2df883ea0cccaa4097358ede98284',
      },
      body: jsonEncode(<String, dynamic>{
        "user_id": 3206161992,
        "feeling_date": "15-04-2022"
      }),
    );

    return response;
  }
}
