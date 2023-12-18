
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practise/data/vos/actor_vo.dart';
import 'package:flutter_practise/data/vos/genre_vo.dart';
import 'package:flutter_practise/data/vos/movie_vo.dart';
import 'package:flutter_practise/network/http_movie_data_agent_impl.dart';
import 'package:flutter_practise/network/retrofit_data_agent_impl.dart';
import 'package:flutter_practise/pages/HomePage.dart';
import 'package:flutter_practise/pages/MovieDetailsPage.dart';
import 'package:flutter_practise/persistance/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'network/dio_movie_data_agent_impl.dart';
//
// void main() {
//   runApp(
//
//       DevicePreview(
//           enabled: true,
//           builder: (context) =>      const MaterialApp(
//         home: HomePage(),
//       ) )
//  );
// }

void main()  async {

 await Hive.initFlutter();

 Hive.registerAdapter(ActorVOAdapter());
 Hive.registerAdapter(MovieVOAdapter());
 Hive.registerAdapter(GenreVOAdapter());

 await Hive.openBox<MovieVO>(BOX_NAME_MOVIE_VO);
 await Hive.openBox<GenreVO>(BOX_NAME_GENRE_VO);
 await Hive.openBox<ActorVO>(BOX_NAME_ACTOR_VO);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}
  class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  debugShowCheckedModeBanner: false,
  locale: DevicePreview.locale(context),
  builder: DevicePreview.appBuilder,
  theme: ThemeData.light(),
  darkTheme: ThemeData.dark(),
  home: HomePage(),
  );
  }
  }
