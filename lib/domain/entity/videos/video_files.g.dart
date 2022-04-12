// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_files.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoFiles _$VideoFilesFromJson(Map<String, dynamic> json) => VideoFiles(
      id: json['id'] as int,
      quality: json['quality'] as String,
      fileType: json['file_type'] as String,
      width: json['width'] as int?,
      height: json['height'] as int?,
      link: json['link'] as String,
    );

Map<String, dynamic> _$VideoFilesToJson(VideoFiles instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quality': instance.quality,
      'file_type': instance.fileType,
      'width': instance.width,
      'height': instance.height,
      'link': instance.link,
    };
