import 'package:dio/dio.dart';
import 'package:flutter_practise/network/api_constant.dart';
import 'package:flutter_practise/network/responses/get_now_playing_movie_response.dart';
import 'package:retrofit/retrofit.dart';

part 'the_movie_api.g.dart';

@RestApi(baseUrl: BASE_URL_DIO)
abstract class TheMovieApi {
  factory TheMovieApi(Dio dio) = _TheMovieApi;

  @GET(GET_NOW_PLAYING)
  Future<GetNowPlayingMovieResponse> getNowPlayingMovie(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page,
      );
  
  @GET(API_GET_POPULAR_MOVIES)
  Future<GetNowPlayingMovieResponse> getPopularMovies(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page,
      );

}