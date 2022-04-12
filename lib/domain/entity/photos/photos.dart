import 'package:json_annotation/json_annotation.dart';
import 'package:pexels_app/domain/entity/photos/src.dart';

part 'photos.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Photos {
  final int id;
  final int width;
  final int height;
  final String url;
  final String photographer;
  final String photographerUrl;
  final int photographerId;
  final String avgColor;
  final Src src;
  final bool liked;
  final String alt;

  Photos(
      {required this.id,
      required this.width,
      required this.height,
      required this.url,
      required this.photographer,
      required this.photographerUrl,
      required this.photographerId,
      required this.avgColor,
      required this.src,
      required this.liked,
      required this.alt});

  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);

  Map<String, dynamic> toJson() => _$PhotosToJson(this);

  @override
  String toString() {
    return 'Photos(id: $id, width: $width, height: $height, url: $url, photographer: $photographer, photographerUrl: $photographerUrl, photographerId: $photographerId, avgColor: $avgColor, src: $src, liked: $liked, alt: $alt)';
  }
}
