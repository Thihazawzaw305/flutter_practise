import 'package:flutter/cupertino.dart';
import 'package:flutter_practise/viewItems/titleText_with_see_more_view.dart';

import '../data/vos/actor_vo.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import 'actor_item_view.dart';

class
ActorsAndCreatorSectionView extends StatelessWidget {
  const ActorsAndCreatorSectionView({
    super.key,  required this.titleText, required this.seeMoreText,  required this.seeMoreTextVisibility, required this.actorList,
  });
  final String titleText;
  final String seeMoreText;
  final bool seeMoreTextVisibility;
  final List<ActorVO> actorList;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PRIMARY_COLOR,
      padding: const EdgeInsets.only(top: MARGIN_MEDIUM_2,bottom:marginXLarge),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            child: TitleTextWithSeeMoreView(titleText: titleText, moreText: seeMoreText, seeMoreTextVisibility: seeMoreTextVisibility,),
          ),
          const SizedBox(height: margin_large),
          SizedBox(
            height: 200,
            child: ListView(
              padding: const EdgeInsets.only(right: margin_medium_2),
              scrollDirection: Axis.horizontal,
              children:
              actorList.map((actor) =>

              ActorItemView(actor: actor)

     ).toList() ?? []


            ),
          ),
        ],
      ),
    );
  }
}