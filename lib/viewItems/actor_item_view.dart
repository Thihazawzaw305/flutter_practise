import 'package:flutter/material.dart';
import 'package:flutter_practise/data/vos/actor_vo.dart';
import 'package:flutter_practise/network/api_constant.dart';
import 'package:flutter_practise/resources/dimens.dart';



class ActorItemView extends StatelessWidget {
  const ActorItemView({super.key, required this.actor});
  final ActorVO actor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MARGIN_MEDIUM_2),
      width: 170,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              "$IMAGE_BASE_URL${actor.profilePath}"?? "",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: ActorFavButton(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ActorNameAndLikeView(actor: actor),
          )
        ],
      ),
    );
  }

}

class ActorFavButton extends StatelessWidget {
  const ActorFavButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(margin_medium),
      child: Icon(
        Icons.favorite_border,
        color: Colors.white,
      ),
    );
  }
}

class ActorNameAndLikeView extends StatelessWidget {
  const ActorNameAndLikeView({
    super.key, required this.actor,
  });
  final ActorVO actor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: margin_medium_2, vertical: margin_medium_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            actor.name ??"",
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),
          ),
          SizedBox(height: margin_medium),
          Row(
            children: [
              Icon(Icons.thumb_up,color: Colors.amber,
              size: MARGIN_MEDIUM_2,),
              SizedBox(width: margin_medium),
              Text("YOU LIKES 15 MOVIES",style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              ),
            ],
//flksjd //thkdff thfhsweweasthidihfa zasw zasf thdfhwppso saht sdfhtddtoweorfdfhtfskf kfkhshdsfhfkrkd fsrkhs
          ),

        ],

      ),

    );


  }
}
