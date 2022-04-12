import 'package:json_annotation/json_annotation.dart';
import 'package:pexels_app/domain/entity/videos/user.dart';
import 'package:pexels_app/domain/entity/videos/video_files.dart';
import 'package:pexels_app/domain/entity/videos/video_pictures.dart';


part 'videos.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Videos {
  int id;
  int width;
  int height;
  String url;
  String image;
  int duration;
  User user;
  List<VideoFiles> videoFiles;
  List<VideoPictures> videoPictures;

  Videos(
      {required this.id,
      required this.width,
      required this.height,
      required this.url,
      required this.image,
      required this.duration,
      required this.user,
      required this.videoFiles,
      required this.videoPictures});

factory Videos.fromJson(Map<String, dynamic> json) => _$VideosFromJson(json);

  Map<String, dynamic> toJson() => _$VideosToJson(this);
}