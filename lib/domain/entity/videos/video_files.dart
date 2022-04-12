import 'package:json_annotation/json_annotation.dart';

part 'video_files.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VideoFiles {
  int id;
  String quality;
  String fileType;
  int? width;
  int? height;
  String link;

  VideoFiles(
      {required this.id,
      required this.quality,
      required this.fileType,
      this.width,
      this.height,
      required this.link});

  factory VideoFiles.fromJson(Map<String, dynamic> json) => _$VideoFilesFromJson(json);

  Map<String, dynamic> toJson() => _$VideoFilesToJson(this);
}