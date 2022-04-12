import 'package:json_annotation/json_annotation.dart';

part 'video_pictures.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VideoPictures {
  int id;
  String picture;
  int nr;

  VideoPictures({
    required this.id,
    required this.picture,
    required this.nr,
  });

  factory VideoPictures.fromJson(Map<String, dynamic> json) => _$VideoPicturesFromJson(json);

  Map<String, dynamic> toJson() => _$VideoPicturesToJson(this);
}
