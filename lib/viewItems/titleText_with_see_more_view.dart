import 'package:flutter/cupertino.dart';
import 'package:flutter_practise/viewItems/see_more_text.dart';
import 'package:flutter_practise/viewItems/title_text_view.dart';

class TitleTextWithSeeMoreView extends StatelessWidget {
  const TitleTextWithSeeMoreView(
      {super.key,
      required this.titleText,
        this.moreText = "MORE SHOWCASES",
      this.seeMoreTextVisibility = true});

  final String titleText;
  final String moreText;

  final bool seeMoreTextVisibility;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TitleText(text: titleText),
        const Spacer(),
        Visibility(
            visible: seeMoreTextVisibility, child: SeeMoreText(text: moreText))
      ],
    );
  }
}
