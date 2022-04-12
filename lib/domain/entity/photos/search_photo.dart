import 'package:json_annotation/json_annotation.dart';
import 'package:pexels_app/domain/entity/photos/photos.dart';

part 'search_photo.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SearchPhoto {
  final int totalResults;
  final int page;
  final int perPage;
  final List<Photos> photos;
  final String nextPage;

  SearchPhoto({
    required this.totalResults,
    required this.page,
    required this.perPage,
    required this.photos,
    required this.nextPage,
  });

  factory SearchPhoto.fromJson(Map<String, dynamic> json) => _$SearchPhotoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPhotoToJson(this);

  @override
  String toString() {
    return 'SearchPhoto(totalResults: $totalResults, page: $page, perPage: $perPage, photos: $photos, nextPage: $nextPage)';
  }
}
