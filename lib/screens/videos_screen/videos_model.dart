import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pexels_app/domain/api_client/api_client.dart';
import 'package:pexels_app/domain/entity/videos/videos.dart';


class VideosModel extends ChangeNotifier {
  final _apiClient = ApiClient();

  List videos = <Videos>[];
  bool isLoading = true;
  int page = 1;
  int index = 0;

  Timer? searchDebounce;

  VideosModel({
    required this.videos,
    required this.index,
  });

  void resetData() {
    videos.clear();
    page = 1;
    index = 0;
  }

  Future<void> getPopularVideos() async {
    final searchVideo = await _apiClient.getPopularVideos(page);
    videos.addAll(searchVideo.videos);
    isLoading = false;
    notifyListeners();
  }

  Future<void> searchVideos(String query) async {
    final searchVideo = await _apiClient.searchVideos(query, page);
    videos.addAll(searchVideo.videos);
    isLoading = false;
    notifyListeners();
  }

  void showedVideoAtIndex(int index, String searchString) {
    if (index < videos.length - 1) return;
    page = page + 1;
    //videos.removeLast;
    if (searchString == '') {
      getPopularVideos();
    } else {
      searchVideos(searchString);
    }
    
  }

  void onChangeTextField(String value) {
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(seconds: 1), () async {
      if (value == '' || value.length < 3) {
        resetData();
        getPopularVideos();
      } else {
        resetData();
        searchVideos(value);
      }
    });
  }
}