import 'package:flutter_practise/data/models/movie_model.dart';
import 'package:flutter_practise/data/vos/movie_vo.dart';
import 'package:flutter_practise/network/movie_data_agent.dart';
import 'package:flutter_practise/network/retrofit_data_agent_impl.dart';

class MovieModelImpl extends MovieModel{

  final MovieDataAgent _dataAgent = RetrofitDataAgentImpl();

  MovieModelImpl._internal();
  static final MovieModelImpl _singleton = MovieModelImpl._internal();
  factory MovieModelImpl(){
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

  
}