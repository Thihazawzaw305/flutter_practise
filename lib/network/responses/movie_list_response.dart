import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/movie_vo.dart';
part 'movie_list_response.g.dart';


@JsonSerializable()
class MovieListResponse{
  @JsonKey(name: "results")
  List<MovieVO>? results;

  @JsonKey(name:"page")
  int? page;

  MovieListResponse(this.results, this.page);

  factory MovieListResponse.fromJson(Map<String, dynamic> json) => _$MovieListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieListResponseToJson(this);
}