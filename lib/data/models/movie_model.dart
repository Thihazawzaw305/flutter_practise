import '../vos/genre_vo.dart';
import '../vos/movie_vo.dart';

abstract class MovieModel{
  Future<List<MovieVO>?> getNowPlayingMovie(int page);
  Future <List<MovieVO>?> getPopularMovie(int page);
  Future<List<GenreVO>?> getGenre();

}