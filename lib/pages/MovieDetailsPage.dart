import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practise/resources/colors.dart';
import 'package:flutter_practise/resources/dimens.dart';
import 'package:flutter_practise/viewItems/actors_and_creators_section_view.dart';
import 'package:flutter_practise/viewItems/gradient_view.dart';
import 'package:flutter_practise/viewItems/rating_view.dart';
import 'package:flutter_practise/viewItems/title_text_view.dart';

class MovieDetailsPage extends StatelessWidget {
  MovieDetailsPage({super.key});

  final List<String> genreList = ["Action", "Horror", "Adventure"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HOME_SCREEN_BACKGROUND_COLOR,
        child: CustomScrollView(
          slivers: [
            MovieDetailsSliverAppBarView(
            () => Navigator.pop(context)
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: margin_medium_2, vertical: margin_medium_2),
                child: TralierSection(genreList),
              ),
              ActorsAndCreatorSectionView(
                titleText: "ACTORS",
                seeMoreTextVisibility: false,
                seeMoreText: "",
              ),
              SizedBox(height: marginLarge),
              AboutFlimSection(),
              SizedBox(height: marginLarge),
              ActorsAndCreatorSectionView(
                  titleText: "CREATORS",
                  seeMoreTextVisibility: true,
                  seeMoreText: "MORE CREATORS")
            ]))
          ],
        ),
      ),
    );
  }
}

class AboutFlimSection extends StatelessWidget {
  const AboutFlimSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin_medium_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(text: "ABOUT FILM"),
          SizedBox(height: marginMedium2),
          AboutFlimInfonView(
              label: "Original Title:", description: "Transformer"),
          SizedBox(height: margin_medium_2),
          AboutFlimInfonView(
              label: "Type:", description: "Action, Horror, Adventure"),
          SizedBox(height: margin_medium_2),
          AboutFlimInfonView(label: "Premiere:", description: "12.13.2023"),
          SizedBox(height: margin_medium_2),
          AboutFlimInfonView(
              label: "Original Title",
              description:
                  "An ancient struggle between two Cybertronian races, the heroic Autobots and the evil Decepticons, comes to Earth, with a clue to the ultimate power held by a teenager."),
        ],
      ),
    );
  }
}

class AboutFlimInfonView extends StatelessWidget {
  const AboutFlimInfonView({
    super.key,
    required this.label,
    required this.description,
  });

  final String label;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: MediaQuery.of(context).size.width / 3,
            child: Text(
              label,
              style: TextStyle(
                  color: HOME_SCREEN_TITLE_LIST_COLOR,
                  fontWeight: FontWeight.w600,
                  fontSize: MARGIN_MEDIUM_2),
            )),
        SizedBox(width: margin_card_medium_2),
        Expanded(
            child: Text(
          description,
          style: TextStyle(color: Colors.white, fontSize: MARGIN_MEDIUM_2),
        ))
      ],
    );
  }
}

class TralierSection extends StatelessWidget {
  TralierSection(
    this.genreList,
  );

  final List<String> genreList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.access_time, color: Colors.amber),
            SizedBox(width: margin_medium),
            Text(
              "2h 30 min",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: textRegular),
            ),
            Row(
              children: genreList.map((genre) => GenreChipView(genre)).toList(),
            )
          ],
        ),
        StoryLineView(),
        SizedBox(
          height: margin_medium_2,
        ),
        Row(
          children: [
            MovieDetailsButtonsView(
                title: "PLAY TRALIER",
                backgroundColor: Colors.amber,
                buttonIcon: Icon(
                  Icons.play_circle_fill,
                  color: Colors.black54,
                ),
                isGhostButton: false),
            Spacer(),
            MovieDetailsButtonsView(
              title: "RATE MOVIE",
              backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
              buttonIcon: Icon(
                Icons.star,
                color: Colors.amber,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class MovieDetailsButtonsView extends StatelessWidget {
  const MovieDetailsButtonsView({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.buttonIcon,
    this.isGhostButton = true,
  });

  final String title;
  final Color backgroundColor;
  final Icon buttonIcon;
  final bool isGhostButton;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: margin_card_medium_2),
        height: marginXXLarge,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(margin_large),
            border: (isGhostButton)
                ? Border.all(
                    color: Colors.white,
                    width: 2,
                  )
                : null),
        child: Center(
          child: Row(
            children: [
              buttonIcon,
              SizedBox(width: margin_medium),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: textRegular),
              ),
            ],
          ),
        ));
  }
}

class StoryLineView extends StatelessWidget {
  const StoryLineView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TitleText(text: "STORYLINE"),
        SizedBox(height: margin_medium),
        Text(
            "An ancient struggle between two Cybertronian races, the heroic Autobots and the evil Decepticons, comes to Earth, with a clue to the ultimate power held by a teenager."),
      ],
    );
  }
}

class GenreChipView extends StatelessWidget {
  const GenreChipView(
    this.text,
  );

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: margin_medium),
        child: Chip(
          label: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: textSmaller),
          ),
          backgroundColor: CHIP_COLOR,
        ));
  }
}

class MovieDetailsSliverAppBarView extends StatelessWidget {
  const MovieDetailsSliverAppBarView(this.onTapBack,{
    super.key,
  });
  final Function onTapBack;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: false,
      floating: false,
      backgroundColor: PRIMARY_COLOR,
      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(children: [
          Positioned.fill(
            child: MovieDetailsAppBarImageView(),
          ),
          Positioned.fill(child: GradientView()),
          Align(
            alignment: Alignment.topLeft,
            child: MovieDetailsBackButtonView(() => onTapBack(),
  ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: SearchButtonView(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  right: margin_medium_2,
                  left: margin_medium_2,
                  bottom: marginLarge),
              child: MovieDetailsAppBarInfo(),
            ),
          )
        ]),
      ),
    );
  }
}

class MovieDetailsAppBarInfo extends StatelessWidget {
  const MovieDetailsAppBarInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            MovieDetailsYearView(),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RatingBarView(),
                    SizedBox(height: margin_small),
                    TitleText(text: "388876 VOTES"),
                    SizedBox(
                      height: margin_card_medium_2,
                    )
                  ],
                ),
                SizedBox(width: margin_medium),
                Text(
                  "9,76",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 56,
                  ),
                )
              ],
            )
          ],
        ),
        SizedBox(height: margin_medium),
        Text(
          "Transformer",
          style: TextStyle(
              color: Colors.white,
              fontSize: textHeading2x,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class MovieDetailsYearView extends StatelessWidget {
  const MovieDetailsYearView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: margin_large),
      height: marginXXLarge,
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(marginXLarge)),
      child: Center(
        child: Text(
          "2016",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class SearchButtonView extends StatelessWidget {
  const SearchButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: marginXLarge, right: margin_medium_2),
      child: Icon(
        Icons.search,
        size: marginXLarge,
      ),
    );
  }
}

class MovieDetailsBackButtonView extends StatelessWidget {
 
  final Function onTapBack;

  MovieDetailsBackButtonView(this.onTapBack);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: marginXLarge, left: margin_medium_2),
      child: GestureDetector(
        onTap: (){
          onTapBack();
        },
        child: Container(
          width: marginXLarge,
          height: marginXLarge,
          decoration: const BoxDecoration(
            color: Colors.black54,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.chevron_left,
          ),
        ),
      ),
    );
  }
}

class MovieDetailsAppBarImageView extends StatelessWidget {
  const MovieDetailsAppBarImageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://i.ebayimg.com/images/g/P7wAAOSwtqFkYoTI/s-l1600.jpg",
      fit: BoxFit.cover,
    );
  }
}
