// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Videos _$VideosFromJson(Map<String, dynamic> json) => Videos(
      id: json['id'] as int,
      width: json['width'] as int,
      height: json['height'] as int,
      url: json['url'] as String,
      image: json['image'] as String,
      duration: json['duration'] as int,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      videoFiles: (json['video_files'] as List<dynamic>)
          .map((e) => VideoFiles.fromJson(e as Map<String, dynamic>))
          .toList(),
      videoPictures: (json['video_pictures'] as List<dynamic>)
          .map((e) => VideoPictures.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideosToJson(Videos instance) => <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'image': instance.image,
      'duration': instance.duration,
      'user': instance.user,
      'video_files': instance.videoFiles,
      'video_pictures': instance.videoPictures,
    };
