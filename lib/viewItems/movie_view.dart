import 'package:flutter/material.dart';
import 'package:flutter_practise/data/vos/movie_vo.dart';
import 'package:flutter_practise/network/api_constant.dart';
import 'package:flutter_practise/viewItems/rating_view.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../resources/dimens.dart';

class MovieView extends StatelessWidget {
  final MovieVO? movie;

  const MovieView( {super.key, required this.movie});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: MARGIN_MEDIUM_2),
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "$IMAGE_BASE_URL${movie?.poster_path}" ?? "",
            height: 190,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: margin_medium_2),
          Text(
            movie?.title ?? "",
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: textRegular,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          Row(
            children: [
              const Text(
                "8.9",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: textRegular,
                    color: Colors.white),
              ),
              RatingBarView(),
            ],
          )
        ],
      ),
    );
  }
}
