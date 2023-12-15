import 'package:flutter_practise/data/vos/actor_vo.dart';
import 'package:flutter_practise/data/vos/genre_vo.dart';
import 'package:flutter_practise/data/vos/movie_vo.dart';

abstract class MovieDataAgent{

  Future <List<MovieVO>?> getNowPlayingMovie(int page);
  Future <List<MovieVO>?> getPopularMovie(int page);
  Future<List<GenreVO>?> getGenre();
  Future<List<MovieVO>?> getTopRatedMovies(int page);
  Future<List<ActorVO>?> getActors();
  Future<List<MovieVO>?> getMovieByGenre(String genreId);
  Future <MovieVO?> getMovieDetails(int movieId);
  Future<List<List<ActorVO>?>> getCreditsByMovie(int movieId);


}