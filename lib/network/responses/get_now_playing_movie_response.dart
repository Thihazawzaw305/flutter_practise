import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/movie_vo.dart';
part 'get_now_playing_movie_response.g.dart';


@JsonSerializable()
class GetNowPlayingMovieResponse{
  @JsonKey(name: "results")
  List<MovieVO>? results;

  @JsonKey(name:"page")
  int? page;

  GetNowPlayingMovieResponse(this.results, this.page);

  factory GetNowPlayingMovieResponse.fromJson(Map<String, dynamic> json) => _$GetNowPlayingMovieResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetNowPlayingMovieResponseToJson(this);
}