import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_practise/data/vos/actor_vo.dart';
import 'package:flutter_practise/data/vos/genre_vo.dart';
import 'package:flutter_practise/data/vos/movie_vo.dart';
import 'package:flutter_practise/network/api_constant.dart';
import 'package:flutter_practise/network/movie_data_agent.dart';
import 'package:flutter_practise/network/the_movie_api.dart';

class RetrofitDataAgentImpl extends MovieDataAgent {
  late TheMovieApi movieAPi;

  static RetrofitDataAgentImpl _singleton = RetrofitDataAgentImpl._internal();

  factory RetrofitDataAgentImpl() {
    return _singleton;
  }

  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    movieAPi = TheMovieApi(dio);
  }

  @override
  Future<List<MovieVO>?> getNowPlayingMovie(int page) {
   return movieAPi.getNowPlayingMovie(API_KEY, LANGUAGE_EN_US, page.toString())
        .asStream()
        .map((response) => response.results)
        .first;

    //throw UnimplementedError();
  }

  @override
  Future<List<MovieVO>?> getPopularMovie(int page) {
   return movieAPi.getPopularMovies(API_KEY, LANGUAGE_EN_US, page.toString())
       .asStream()
       .map((response) => response.results)
       .first;
  }

  @override
  Future<List<GenreVO>?> getGenre() {
   return movieAPi.getGenres(API_KEY)
       .asStream()
       .map((response) => response.genres)
       .first;

  }

  @override
  Future<List<MovieVO>?> getTopRatedMovies(int page) {
    return movieAPi.getTopRatedMovies(API_KEY, page.toString())
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<ActorVO>?> getActors() {
  return movieAPi.getActors(API_KEY)
      .asStream()
      .map((response) => response.results)
      .first;
  }

  @override
  Future<List<MovieVO>?> getMovieByGenre(String genreId) {
   return movieAPi.getMovieByGenre(genreId, API_KEY)
       .asStream()
       .map((response) =>
   response.results)
       .first;
  }

  @override
  Future<List<List<ActorVO>?>> getCreditsByMovie(int movieId) {
   return movieAPi.getCreditsByMovie(movieId.toString(), API_KEY)
       .asStream()
   .map((response) =>
   [
     response.cast,
     response.crew
   ])
       .first;
  }

  @override
  Future<MovieVO?> getMovieDetails(int movieId) {
    return movieAPi.getMovieDetails(movieId.toString(), API_KEY);

  }




}
