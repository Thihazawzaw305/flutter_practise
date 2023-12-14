import '../vos/movie_vo.dart';

abstract class MovieModel{
  Future<List<MovieVO>?> getNowPlayingMovie(int page);
  Future <List<MovieVO>?> getPopularMovie(int page);

}