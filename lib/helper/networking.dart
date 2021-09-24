import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app/models/photos_model.dart';

class Services {
  static const String photoUrl =
      "https://api.pexels.com/v1/curated?&per_page=15";
  static const String apiKey =
      '563492ad6f917000010000019d5d84de781341aba3728458801236a7';
  Future<PhotoModel?> getPhotos() async {
    PhotoModel? photoModel;

    try {
      final response = await http
          .get(Uri.parse(photoUrl), headers: {"Authorization": apiKey});
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.statusCode);
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);
        photoModel = PhotoModel.fromJson(jsonMap);
      } else {
        // ignore: avoid_print
        print(response.statusCode);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return photoModel;
  }
}
