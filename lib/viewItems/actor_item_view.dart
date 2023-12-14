import 'package:flutter/material.dart';
import 'package:flutter_practise/resources/dimens.dart';



class ActorItemView extends StatelessWidget {
  const ActorItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MARGIN_MEDIUM_2),
      width: 190,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              "https://render.fineartamerica.com/images/rendered/medium/poster/7.5/10/break/images/artworkimages/medium/3/a-hero-rises-photograph-by-williams-and-hirakawa-for-time.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: ActorFavButton(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ActorNameAndLikeView(),
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
    super.key,
  });

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
            "Black Panter",
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),
          ),
          SizedBox(height: margin_medium),
          Row(
            children: [
              Icon(Icons.thumb_up,color: Colors.amber,
              size: MARGIN_MEDIUM_2,),
              SizedBox(width: margin_medium),
              Text("YOU LIKES 15 MOVIES",style: TextStyle(
                fontSize: textSmaller,
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
