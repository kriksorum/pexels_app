import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:pexels_app/domain/api_client/api_client.dart';
import 'package:pexels_app/domain/entity/photos/photos.dart';

class PhotosModel extends ChangeNotifier {
  final _apiClient = ApiClient();

  Timer? searchDebounce;
  List photos = <Photos>[];
  bool isLoading = true;
  int page = 1;
  int index = 0;
  PhotosModel({
    required this.photos,
    required this.index,
  });

  Future<void> getCuratedPhotos() async {
    final searchPhoto = await _apiClient.getCuratedPhotos(page);
    photos.addAll(searchPhoto.photos);
    isLoading = false;
    notifyListeners();
  }

  Future<void> searchPhotos(String query) async {
    final searchPhoto = await _apiClient.searchPhotos(query, page);
    photos.addAll(searchPhoto.photos);
    isLoading = false;
    notifyListeners();
  }

  void showedPhotoAtIndex(int index, String searchString) {
    if (index < photos.length - 1) return;
    page = page + 1;
    photos.removeLast;
    if (searchString == '') {
      getCuratedPhotos();
    } else {
      searchPhotos(searchString);
    }
    
  }

  // void savePhotoAtIndex(int index) {
  //   this.index = index;
  //   notifyListeners();
  // }

  void resetData() {
    photos.clear();
    page = 1;
    index = 0;
  }

  void onChangeTextField(String value) {
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 300), () async {
      if (value == '' || value.length < 3) {
        resetData();
        getCuratedPhotos();
      } else {
        resetData();
        searchPhotos(value);
      }
    });
  }

  void saveNetworkImage(String path, String name) async {
    if (name == '') name = 'image';
    await _requestPermission();
    var response = await Dio()
        .get(path, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: name);
    // ignore: avoid_print
    print(result);
  }

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    // ignore: avoid_print
    print(info);
  }
}
