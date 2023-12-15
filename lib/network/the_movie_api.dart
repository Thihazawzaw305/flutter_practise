import 'package:dio/dio.dart';
import 'package:flutter_practise/network/api_constant.dart';
import 'package:flutter_practise/network/responses/get_actor_list_response.dart';
import 'package:flutter_practise/network/responses/get_credit_by_movie_response.dart';
import 'package:flutter_practise/network/responses/get_genre_response.dart';
import 'package:flutter_practise/network/responses/movie_list_response.dart';
import 'package:retrofit/retrofit.dart';

import '../data/vos/movie_vo.dart';

part 'the_movie_api.g.dart';

@RestApi(baseUrl: BASE_URL_DIO)
abstract class TheMovieApi {
  factory TheMovieApi(Dio dio) = _TheMovieApi;

  @GET(GET_NOW_PLAYING)
  Future<MovieListResponse> getNowPlayingMovie(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page,
      );
  
  @GET(API_GET_POPULAR_MOVIES)
  Future<MovieListResponse> getPopularMovies(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page,
      );

  @GET(API_GET_GENRES)
  Future<GetGenreResponse> getGenres(
  @Query(PARAM_API_KEY)  String apiKey,
  );

  @GET(API_GET_TOP_RATED_MOVIES)
  Future<MovieListResponse> getTopRatedMovies(
  @Query(PARAM_API_KEY)  String apiKey ,
  @Query(PARAM_PAGE) String page,
      );

  @GET(API_GET_ACTORS)
  Future<GetActorsResponse> getActors(
  @Query(PARAM_API_KEY)  String apiKey,
  );

  @GET(API_GET_MOVIES_BY_GENRE)
  Future<MovieListResponse> getMovieByGenre(
  @Query(PARAM_GENRE_ID) String genreId,
  @Query(PARAM_API_KEY) String apiKey ,
  );

  @GET("$API_GET_MOVIE_DETAILS/{movie_id}")
  Future <MovieVO?> getMovieDetails(
  @Path("movie_id") String movieId,
  @Query(PARAM_API_KEY) String apiKey,
  );

  @GET("$API_GET_CREDITS_BY_MOVIE/{movie_id}/credits")
  Future<GetCreditByMovieResponse> getCreditsByMovie(
  @Path("movie_id") String movieId,
  @Query(PARAM_API_KEY)  String apiKey ,
  );

}