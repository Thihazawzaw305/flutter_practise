import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
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




}
