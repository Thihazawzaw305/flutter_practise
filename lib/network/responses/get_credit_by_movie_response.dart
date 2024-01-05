
import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/actor_vo.dart';
part 'get_credit_by_movie_response.g.dart';

@JsonSerializable()
class GetCreditByMovieResponse{


  @JsonKey(name: "cast")
  List<ActorVO>? cast ;

  @JsonKey(name: "crew")
  List<ActorVO>? crew;

  GetCreditByMovieResponse(this.cast, this.crew);


  factory GetCreditByMovieResponse.fromJson(Map<String,dynamic> json) => _$GetCreditByMovieResponseFromJson(json);
  Map<String,dynamic> json() => _$GetCreditByMovieResponseToJson(this);
}

