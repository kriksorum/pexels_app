import 'package:json_annotation/json_annotation.dart';
import 'package:pexels_app/domain/entity/videos/videos.dart';

part 'search_video.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SearchVideos {
  int page;
  int perPage;
  int totalResults;
  String url;
  List<Videos> videos;

  SearchVideos({
    required this.page,
    required this.perPage,
    required this.totalResults,
    required this.url,
    required this.videos,
  });

  factory SearchVideos.fromJson(Map<String, dynamic> json) => _$SearchVideosFromJson(json);

  Map<String, dynamic> toJson() => _$SearchVideosToJson(this);
}
