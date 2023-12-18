import 'package:flutter_practise/data/models/movie_model.dart';
import 'package:flutter_practise/data/vos/actor_vo.dart';
import 'package:flutter_practise/data/vos/genre_vo.dart';
import 'package:flutter_practise/data/vos/movie_vo.dart';
import 'package:flutter_practise/network/movie_data_agent.dart';
import 'package:flutter_practise/network/retrofit_data_agent_impl.dart';
import 'package:flutter_practise/persistance/daos/actor_dao.dart';
import 'package:flutter_practise/persistance/daos/genre_dao.dart';

import '../../persistance/daos/movie_dao.dart';

class MovieModelImpl extends MovieModel {
  final MovieDataAgent _dataAgent = RetrofitDataAgentImpl();

  MovieModelImpl._internal();

  static final MovieModelImpl _singleton = MovieModelImpl._internal();

  factory MovieModelImpl() {
    return _singleton;
  }

  ///Dao
  MovieDao mMovieDao = MovieDao();
  ActorDao mActorDao = ActorDao();
  GenreDao mGenreDao = GenreDao();

  @override
  Future<List<MovieVO>?> getNowPlayingMovie(int page) {
    return _dataAgent.getNowPlayingMovie(page).then((movies) async {
      List<MovieVO>? nowPlayingMovie = movies?.map((movie) {
        movie.isTopRated = false;
        movie.isPopular = false;
        movie.isNowPlaying = true;
        return movie;
      }).toList();
      mMovieDao.saveAllMovie(nowPlayingMovie!);
      return Future.value(movies);
    });
  }

  @override
  Future<List<MovieVO>?> getPopularMovie(int page) {
    return _dataAgent.getPopularMovie(page).then((movies) async {
      List<MovieVO>? nowPlayingMovie = movies?.map((movie) {
        movie.isTopRated = false;
        movie.isPopular = true;
        movie.isNowPlaying = false;
        return movie;
      }).toList();
      mMovieDao.saveAllMovie(nowPlayingMovie!);
      return Future.value(movies);
    });
  }

  @override
  Future<List<GenreVO>?> getGenre() {
    return _dataAgent.getGenre().then((genres) async {
      mGenreDao.saveAllGenres(genres!);
      return Future.value(genres);
    });
  }

  @override
  Future<List<MovieVO>?> getTopRatedMovies(int page) {
    return _dataAgent.getTopRatedMovies(page).then((movies) async {
      List<MovieVO>? nowPlayingMovie = movies?.map((movie) {
        movie.isTopRated = true;
        movie.isPopular = false;
        movie.isNowPlaying = false;
        return movie;
      }).toList();
      mMovieDao.saveAllMovie(nowPlayingMovie!);
      return Future.value(movies);
    });
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
    return _dataAgent.getMovieDetails(movieId).then((movie) async {
      mMovieDao.saveSingleMovie(movie!);
      return Future.value(movie);
    });
  }

  @override
  Future<List<ActorVO>> getAllActorsFromDatabase() {
   return Future.value(mActorDao.getAllActors());
  }

  @override
  Future<List<GenreVO>> getGenreFromDatabase() {
    return Future.value(mGenreDao.getAllGenres());

  }

  @override
  Future<MovieVO> getMovieDetailsFromDatabase(int movieId) {
    return Future.value(mMovieDao.getMovieById(movieId));
  }

  @override
  Future<List<MovieVO>> getNowPlayingMovieFromDatabase() {
    return Future.value(mMovieDao
        .getAllMovies()
        .where((movie) => movie.isNowPlaying ?? true )
        .toList()
    );
  }

  @override
  Future<List<MovieVO>> getPopularMovieFromDatabase() {
    return Future.value(mMovieDao
        .getAllMovies()
        .where((movie) => movie.isPopular ?? true )
        .toList()
    );
  }

  @override
  Future<List<MovieVO>> getTopRatedMovieFromDatabase() {
   return Future.value(mMovieDao
   .getAllMovies()
       .where((movie) => movie.isTopRated ?? true )
       .toList()
   );
  }
}
