// import 'package:flutter/cupertino.dart';
// import 'package:flutter_practise/network/api_constant.dart';
// import 'package:flutter_practise/network/movie_data_agent.dart';
// import 'package:http/http.dart'as http;
// import 'package:flutter_practise/network/api_constant.dart';
//
// class HttpMovieDataAgentImpl extends MovieDataAgent{
//   @override
//   void getNowPlayingMovie(int page) {
//     Map<String, String> queryParameters = {
//       PARAM_API_KEY : API_KEY,
//       PARAM_LANGUAGE : LANGUAGE_EN_US,
//       PARAM_PAGE : page.toString()
//     };
//     var url = Uri.https(BASE_URL_HTTP,GET_NOW_PLAYING,queryParameters);
//     http.get(url).then((value){
//       debugPrint("Now playing movies => ${value.body.toString()}");
//
//     }).catchError((error){
//       debugPrint("Error => ${error.toString()}");
//
//
//     });
//   }
// }