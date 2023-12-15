import 'package:flutter_practise/data/models/movie_model.dart';
import 'package:flutter_practise/data/vos/actor_vo.dart';
import 'package:flutter_practise/data/vos/genre_vo.dart';
import 'package:flutter_practise/data/vos/movie_vo.dart';
import 'package:flutter_practise/network/movie_data_agent.dart';
import 'package:flutter_practise/network/retrofit_data_agent_impl.dart';

class MovieModelImpl extends MovieModel {
  final MovieDataAgent _dataAgent = RetrofitDataAgentImpl();

  MovieModelImpl._internal();

  static final MovieModelImpl _singleton = MovieModelImpl._internal();

  factory MovieModelImpl() {
    return _singleton;
  }

  @override
  Future<List<MovieVO>?> getNowPlayingMovie(int page) {
    return _dataAgent.getNowPlayingMovie(page);
  }

  @override
  Future<List<MovieVO>?> getPopularMovie(int page) {
    return _dataAgent.getPopularMovie(page);
  }

  @override
  Future<List<GenreVO>?> getGenre() {
    return _dataAgent.getGenre();
  }

  @override
  Future<List<MovieVO>?> getTopRatedMovies(int page) {
    return _dataAgent.getTopRatedMovies(page);
  }

  @override
  Future<List<ActorVO>?> getActors() {
    return _dataAgent.getActors();
  }

  @override
  Future<List<MovieVO>?> getMovieByGenre(String genreId) {
    return _dataAgent.getMovieByGenre(genreId);
  }

  @override
  Future<List<List<ActorVO>?>> getCreditsByMovie(int movieId) {
    return _dataAgent.getCreditsByMovie(movieId);
  }

  @override
  Future<MovieVO?> getMovieDetails(int movieId) {
    return _dataAgent.getMovieDetails(movieId);
  }
}
