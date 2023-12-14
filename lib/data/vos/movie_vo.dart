import 'package:json_annotation/json_annotation.dart';
part 'movie_vo.g.dart';

@JsonSerializable()
class MovieVO {
  @JsonKey(name: "adult")
  bool? adult;

  @JsonKey(name: "backdrop_path")
  String? backdrop_path;

  @JsonKey(name: "genre_ids")
  List<int>? genre_ids;

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "original_language")
  String? original_language;

  @JsonKey(name: "original_title")
  String? original_title;

  @JsonKey(name: "overview")
  String? overview;

  @JsonKey(name: "popularity")
  double? popularity;

  @JsonKey(name: "poster_path")
  String? poster_path;

  @JsonKey(name: "release_date")
  String? release_date;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "video")
  bool? video;

  @JsonKey(name: "vote_average")
  double? vote_average;

  @JsonKey(name: "vote_count")
  int? vote_count;

  MovieVO(
      this.adult,
      this.backdrop_path,
      this.genre_ids,
      this.id,
      this.original_language,
      this.original_title,
      this.overview,
      this.popularity,
      this.poster_path,
      this.release_date,
      this.title,
      this.video,
      this.vote_average,
      this.vote_count);

  factory MovieVO.fromJson(Map<String, dynamic> json) => _$MovieVOFromJson(json);
  Map<String, dynamic> toJson() => _$MovieVOToJson(this);

  @override
  String toString() {
    return 'MovieVO{adult: $adult, backdrop_path: $backdrop_path, genre_ids: $genre_ids, id: $id, original_language: $original_language, original_title: $original_title, overview: $overview, popularity: $popularity, poster_path: $poster_path, release_date: $release_date, title: $title, video: $video, vote_average: $vote_average, vote_count: $vote_count}';
  }
}