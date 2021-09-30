import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app/models/photos_model.dart';

class Services {
  static const String photoUrl =
      "https://api.pexels.com/v1/curated?&per_page=30";
      
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
  Future<PhotoModel?> getSearchedPhotos(String query)async{
    PhotoModel? searchModel;
     String searchPhotoUrl="https://api.pexels.com/v1/search?query=$query&per_page=30";

    try{
      final response = await http.get(Uri.parse(searchPhotoUrl),headers: {"Authorization": apiKey});
      if(response.statusCode==200){
        // ignore: avoid_print
        print(response.statusCode);
        var jsonStri=response.body;
        var jsonMa=jsonDecode(jsonStri);
        searchModel=PhotoModel.fromJson(jsonMa);
      }else{
        // ignore: avoid_print
        print(response.statusCode);
      }
      
    } catch(e){
      // ignore: avoid_print
      print(e);
    }
    return searchModel;
  }
}
