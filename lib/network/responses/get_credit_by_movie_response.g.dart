// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_credit_by_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCreditByMovieResponse _$GetCreditByMovieResponseFromJson(
        Map<String, dynamic> json) =>
    GetCreditByMovieResponse(
      (json['cast'] as List<dynamic>?)
          ?.map((e) => ActorVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['crew'] as List<dynamic>?)
          ?.map((e) => ActorVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCreditByMovieResponseToJson(
        GetCreditByMovieResponse instance) =>
    <String, dynamic>{
      'cast': instance.cast,
      'crew': instance.crew,
    };
