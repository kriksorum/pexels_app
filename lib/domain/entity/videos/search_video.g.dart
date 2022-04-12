// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchVideos _$SearchVideosFromJson(Map<String, dynamic> json) => SearchVideos(
      page: json['page'] as int,
      perPage: json['per_page'] as int,
      totalResults: json['total_results'] as int,
      url: json['url'] as String,
      videos: (json['videos'] as List<dynamic>)
          .map((e) => Videos.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchVideosToJson(SearchVideos instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total_results': instance.totalResults,
      'url': instance.url,
      'videos': instance.videos,
    };
