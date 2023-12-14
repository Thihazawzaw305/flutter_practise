import 'package:flutter_practise/data/vos/movie_vo.dart';

abstract class MovieDataAgent{

  Future <List<MovieVO>?> getNowPlayingMovie(int page);
  Future <List<MovieVO>?> getPopularMovie(int page);

}