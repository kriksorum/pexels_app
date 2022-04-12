// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPhoto _$SearchPhotoFromJson(Map<String, dynamic> json) => SearchPhoto(
      totalResults: json['total_results'] as int,
      page: json['page'] as int,
      perPage: json['per_page'] as int,
      photos: (json['photos'] as List<dynamic>)
          .map((e) => Photos.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPage: json['next_page'] as String,
    );

Map<String, dynamic> _$SearchPhotoToJson(SearchPhoto instance) =>
    <String, dynamic>{
      'total_results': instance.totalResults,
      'page': instance.page,
      'per_page': instance.perPage,
      'photos': instance.photos,
      'next_page': instance.nextPage,
    };
