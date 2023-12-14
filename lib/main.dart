
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practise/network/http_movie_data_agent_impl.dart';
import 'package:flutter_practise/network/retrofit_data_agent_impl.dart';
import 'package:flutter_practise/pages/HomePage.dart';
import 'package:flutter_practise/pages/MovieDetailsPage.dart';

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

void main() {
  RetrofitDataAgentImpl().getNowPlayingMovie(1);
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
