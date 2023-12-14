// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_now_playing_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNowPlayingMovieResponse _$GetNowPlayingMovieResponseFromJson(
        Map<String, dynamic> json) =>
    GetNowPlayingMovieResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['page'] as int?,
    );

Map<String, dynamic> _$GetNowPlayingMovieResponseToJson(
        GetNowPlayingMovieResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'page': instance.page,
    };
