import '../vos/actor_vo.dart';
import '../vos/genre_vo.dart';
import '../vos/movie_vo.dart';

abstract class MovieModel{
  //network
  Future<List<MovieVO>?> getNowPlayingMovie(int page);
  Future <List<MovieVO>?> getPopularMovie(int page);
  Future<List<GenreVO>?> getGenre();
  Future<List<MovieVO>?> getTopRatedMovies(int page);
  Future<List<ActorVO>?> getActors();
  Future<List<MovieVO>?> getMovieByGenre(String genreId);
  Future <MovieVO?> getMovieDetails(int movieId);
  Future<List<List<ActorVO>?>> getCreditsByMovie(int movieId);

  //Database
Future<List<MovieVO>> getNowPlayingMovieFromDatabase();
Future<List<MovieVO>> getPopularMovieFromDatabase();
Future<List<MovieVO>> getTopRatedMovieFromDatabase();
Future<List<GenreVO>> getGenreFromDatabase();
Future<List<ActorVO>> getAllActorsFromDatabase();
Future<MovieVO> getMovieDetailsFromDatabase(int movieId);

}