import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practise/network/api_constant.dart';
import 'package:flutter_practise/resources/colors.dart';
import 'package:flutter_practise/resources/dimens.dart';
import 'package:flutter_practise/viewItems/play_button_view.dart';

import '../data/vos/movie_vo.dart';
import 'gradient_view.dart';

class BannerView extends StatelessWidget {
  const BannerView({super.key, required this.movie});

  final MovieVO movie;

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Positioned.fill(child: 
        BannerImageView(bannerImage: movie.poster_path?.toString() ??""),
        ),
        Positioned.fill(child: GradientView(),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: BannerTitleView(bannerTitle: movie.title ?? "",),
        ),
        Align(
          alignment: Alignment.center,
          child: playButtonView()
        )

      ],
    );
  }
}



class BannerImageView extends StatelessWidget {
  const BannerImageView({
    super.key, required this.bannerImage,
  });

  final String? bannerImage;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$IMAGE_BASE_URL$bannerImage",
      fit: BoxFit.cover,
    );
  }
}


class BannerTitleView extends StatelessWidget {
  const BannerTitleView({
    super.key, required this.bannerTitle,
  });

  final String ?bannerTitle;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: margin_medium_2),
          child: Text(
            bannerTitle ?? "",
            style: TextStyle(
              color: Colors.white,
              fontSize: textHeading1x,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: margin_medium_2,bottom: margin_medium_2),
          child: Text(
            "Official Review",
            style: TextStyle(
                color: Colors.white,
                fontSize: textHeading1x,
                fontWeight: FontWeight.w600
            ),
          ),
        ),
      ],
    );
  }
}
