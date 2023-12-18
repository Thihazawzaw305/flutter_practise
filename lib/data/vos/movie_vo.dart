import 'package:flutter_practise/persistance/hive_constants.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

import 'genre_vo.dart';
part 'movie_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_MOVIE_VO,adapterName: "MovieVOAdapter")
class MovieVO {
  @HiveField(0)
  @JsonKey(name: "adult")
  bool? adult;

  @HiveField(1)
  @JsonKey(name: "backdrop_path")
  String? backdrop_path;


  @HiveField(2)
  @JsonKey(name: "genre_ids")
  List<int>? genre_ids;

  @HiveField(3)
  @JsonKey(name: "id")
  int? id;

  @HiveField(4)
  @JsonKey(name: "original_language")
  String? original_language;

  @HiveField(5)
  @JsonKey(name: "original_title")
  String? original_title;

  @HiveField(6)
  @JsonKey(name: "overview")
  String? overview;

  @HiveField(7)
  @JsonKey(name: "popularity")
  double? popularity;

  @HiveField(8)
  @JsonKey(name: "poster_path")
  String? poster_path;

  @HiveField(9)
  @JsonKey(name: "release_date")
  String? release_date;

  @HiveField(10)
  @JsonKey(name: "title")
  String? title;

  @HiveField(11)
  @JsonKey(name: "video")
  bool? video;

  @HiveField(12)
  @JsonKey(name: "vote_average")
  double? vote_average;

  @HiveField(13)
  @JsonKey(name: "vote_count")
  int? vote_count;

  @HiveField(14)
  @JsonKey(name: "genres")
  List<GenreVO>? genres;

  @HiveField(15)
  bool? isNowPlaying;

  @HiveField(16)
  bool? isPopular;

  @HiveField(17)
  bool? isTopRated;

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
      this.vote_count,
      this.genres,
      this.isNowPlaying,
      this.isPopular,
      this.isTopRated
      );

  factory MovieVO.fromJson(Map<String, dynamic> json) => _$MovieVOFromJson(json);
  Map<String, dynamic> toJson() => _$MovieVOToJson(this);

  @override
  String toString() {
    return 'MovieVO{adult: $adult, backdrop_path: $backdrop_path, genre_ids: $genre_ids, id: $id, original_language: $original_language, original_title: $original_title, overview: $overview, popularity: $popularity, poster_path: $poster_path, release_date: $release_date, title: $title, video: $video, vote_average: $vote_average, vote_count: $vote_count}';
  }


  List<String> genreListToStringList() {

    return genres?.map((genre) => genre.name ?? "").toList() ?? [];

}

String genreListToCommaSeparatedString(){

    return genreListToStringList().join(",") ?? "";
}

}

