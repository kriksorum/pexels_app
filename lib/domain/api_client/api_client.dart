import 'package:pexels_app/domain/entity/photos/search_photo.dart';
import 'package:pexels_app/domain/entity/photos/photos.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pexels_app/domain/entity/videos/search_video.dart';


class ApiClient {
  String apiKey = '563492ad6f91700001000001a237e4de7f8e4bf5bce519a58b0d6f17';


  Future<SearchPhoto> getCuratedPhotos(int page) async{
    var response = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/curated").replace(
              queryParameters: {
                "page": "$page",
              }
            ),
        headers: {"Authorization": apiKey},  
        );

    final searchPhoto = SearchPhoto.fromJson(json.decode(response.body));
    return searchPhoto;
  } 

  Future<SearchPhoto> searchPhotos(String query, int page) async{
    var response = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search").replace(
              queryParameters: {
                "query": query,
                "page": "$page",
              }
            ),
        headers: {"Authorization": apiKey},  
        );
    final searchPhoto = SearchPhoto.fromJson(json.decode(response.body));
    return searchPhoto;
  } 

  Future<Photos> getPhotos(int id) async{
    var response = await http.get(
      Uri.parse("https://api.pexels.com/v1/photos/").replace(
        queryParameters: {
          "id": "$id",
        }
      ),
      headers: {"Authorization": apiKey},
    );
    final photos = Photos.fromJson(json.decode(response.body));
    //print(photos);
    return photos;
  }

  Future<SearchVideos> getPopularVideos(int page) async{
    var response = await http.get(
        Uri.parse(
            "https://api.pexels.com/videos/popular").replace(
              queryParameters: {
                "page": "$page",
              }
            ),
        headers: {"Authorization": apiKey},  
        );

    final searchVideos = SearchVideos.fromJson(json.decode(response.body));
    return searchVideos;
  } 

  Future<SearchVideos> searchVideos(String query, int page) async{
    var response = await http.get(
        Uri.parse(
            "https://api.pexels.com/videos/search").replace(
              queryParameters: {
                "query": query,
                "page": "$page",
              }
            ),
        headers: {"Authorization": apiKey},  
        );
    final searchVideos = SearchVideos.fromJson(json.decode(response.body));
    return searchVideos;
  }
}