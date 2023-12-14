import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practise/viewItems/play_button_view.dart';
import 'package:flutter_practise/viewItems/title_text_view.dart';

import '../resources/dimens.dart';

class ShowCaseView extends StatelessWidget {
  const ShowCaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM_2),
      width: 300,
      child: Stack(children: [
        Positioned.fill(
          child: Image.network(
            "https://i.ebayimg.com/images/g/P7wAAOSwtqFkYoTI/s-l1600.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: playButtonView(),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(margin_medium_2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Transformer",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: textRegular2x,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: margin_small),
               TitleText(text: "15 DECEMBER 2023")
              ],
            ),
          ),
        )
      ]),
    );
  }
}
