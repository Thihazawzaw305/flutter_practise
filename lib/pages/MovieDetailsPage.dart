import 'package:flutter/material.dart';
import 'package:flutter_practise/data/models/movie_model.dart';
import 'package:flutter_practise/data/models/movie_model_impl.dart';
import 'package:flutter_practise/data/vos/movie_vo.dart';
import 'package:flutter_practise/network/api_constant.dart';
import 'package:flutter_practise/resources/colors.dart';
import 'package:flutter_practise/resources/dimens.dart';
import 'package:flutter_practise/viewItems/actors_and_creators_section_view.dart';
import 'package:flutter_practise/viewItems/gradient_view.dart';
import 'package:flutter_practise/viewItems/rating_view.dart';
import 'package:flutter_practise/viewItems/title_text_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../data/vos/actor_vo.dart';

class MovieDetailsPage extends StatefulWidget {
  final int movieId;

  const MovieDetailsPage({super.key, required this.movieId});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final List<String> genreList = ["Action", "Horror", "Adventure", "Si-Fi", "funny", "Ha ha"];
  final MovieModel _movieModel = MovieModelImpl();
  MovieVO? movieDetails;
  List<ActorVO>? actor;
  List<ActorVO>? crew;

  @override
  void initState() {
    _movieModel.getMovieDetails(widget.movieId).then((movieDetails) {
      setState(() {
        this.movieDetails = movieDetails;
      });
    }).catchError((onError) {
      debugPrint(onError.toString());
    });

    _movieModel.getMovieDetailsFromDatabase(widget.movieId).then((movieDetails) {
      setState(() {
        this.movieDetails = movieDetails;
      });
    }).catchError((onError) {
      debugPrint(onError.toString());

    });



    

    _movieModel.getCreditsByMovie(widget.movieId).then((castAndCrew) {
      setState(() {
        actor = castAndCrew.first;
        crew = castAndCrew[1];
      });
    }).catchError((onError) {
      debugPrint(onError.toString());
    });

    //the thek ddud the the thek tf
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HOME_SCREEN_BACKGROUND_COLOR,
        child: CustomScrollView(
          slivers: [
            MovieDetailsSliverAppBarView(
                movie: movieDetails, () => Navigator.pop(context)),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: margin_medium_2, vertical: margin_medium_2),
                child: TralierSection(
                  storyLine: movieDetails?.overview ?? "",
                  genreList: movieDetails?.genreListToStringList() ?? [],
                ),
              ),
              ActorsAndCreatorSectionView(
                actorList: actor ?? [],
                titleText: "ACTORS",
                seeMoreTextVisibility: false,
                seeMoreText: "",
              ),
              const SizedBox(height: marginLarge),
              AboutFlimSection(
                aboutFilm: movieDetails,
              ),
              const SizedBox(height: marginLarge),
              ActorsAndCreatorSectionView(
                  actorList: crew ?? [],
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
    required this.aboutFilm,
  });

  final MovieVO? aboutFilm;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: margin_medium_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleText(text: "ABOUT FILM"),
          const SizedBox(height: marginMedium2),
          AboutFlimInfonView(
              label: "Original Title:", description: aboutFilm?.title ?? ""),
          const SizedBox(height: margin_medium_2),
          AboutFlimInfonView(
              label: "Type:",
              description: "${aboutFilm?.genreListToCommaSeparatedString() ?? []}"),
          const SizedBox(height: margin_medium_2),
          AboutFlimInfonView(
              label: "Premiere:", description: aboutFilm?.release_date ?? ""),
          const SizedBox(height: margin_medium_2),
          AboutFlimInfonView(
              label: "Description", description: aboutFilm?.overview ?? ""),
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
        SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Text(
              label,
              style: const TextStyle(
                  color: HOME_SCREEN_TITLE_LIST_COLOR,
                  fontWeight: FontWeight.w600,
                  fontSize: MARGIN_MEDIUM_2),
            )),
        const SizedBox(width: margin_card_medium_2),
        Expanded(
            child: Text(
          description,
          style: const TextStyle(color: Colors.white, fontSize: MARGIN_MEDIUM_2),
        ))
      ],
    );
  }
}

class TralierSection extends StatelessWidget {
  const TralierSection({super.key, required this.genreList, required this.storyLine});

  final List<String> genreList;
  final String storyLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(Icons.access_time, color: Colors.amber),
            const SizedBox(width: margin_medium),
            const Text(
              "2h 30 min",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: textRegular),
            ),
            const SizedBox(width: margin_small),
            ...genreList.map((genre) => GenreChipView(genre)  ).toList(),
          ],
        ),
        StoryLineView(
          storyLine: storyLine,
        ),
        const SizedBox(
          height: margin_medium_2,
        ),
        const Row(
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
        padding: const EdgeInsets.symmetric(horizontal: margin_card_medium_2),
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
              const SizedBox(width: margin_medium),
              Text(
                title,
                style: const TextStyle(
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
    required this.storyLine,
  });

  final String storyLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const TitleText(text: "STORYLINE"),
        const SizedBox(height: margin_medium),
        Text(storyLine,style: const TextStyle(color: Colors.white),),
      ],
    );
  }
}
//hdfsts thddskfe oer fkhskotudfkkf fehefdhfdfh dfheorfkhdl oorufdfhkfdgs thkdgg
class GenreChipView extends StatelessWidget {
  const GenreChipView(
    this.text, {super.key}
  );

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
        children: [
      Chip(
        label: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: textSmaller),
        ),
        backgroundColor: CHIP_COLOR,
      ),
      const SizedBox(width: marginSmall)
    ]);
  }
}

class MovieDetailsSliverAppBarView extends StatelessWidget {
  const MovieDetailsSliverAppBarView(
    this.onTapBack, {
    super.key,
    required this.movie,
  });

  final Function onTapBack;
  final MovieVO? movie;

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
            child: MovieDetailsAppBarImageView(
              imageString: movie?.poster_path,
            ),
          ),
          const Positioned.fill(child: GradientView()),
          Align(
            alignment: Alignment.topLeft,
            child: MovieDetailsBackButtonView(
              () => onTapBack(),
            ),
          ),
          const Align(
            alignment: Alignment.topRight,
            child: SearchButtonView(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: margin_medium_2,
                  left: margin_medium_2,
                  bottom: marginLarge),
              child: MovieDetailsAppBarInfo(
                movieInfo: movie,
              ),
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
    required this.movieInfo,
  });

  final MovieVO? movieInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            MovieDetailsYearView(
              releaseYear: movieInfo?.release_date?.substring(0, 4) ?? "",
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const RatingBarView(),
                    const SizedBox(height: margin_small),
                    TitleText(
                        text: "${movieInfo?.vote_count} VOTE COUNT"),
                    const SizedBox(
                      height: margin_card_medium_2,
                    )
                  ],
                ),
                const SizedBox(width: margin_medium),
                Text(
                  "${movieInfo?.vote_average.toString().substring(0, 3)}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                  ),
                )
              ],
            )
          ],
        ),
        const SizedBox(height: margin_medium),
        Text(
          movieInfo?.title ?? "",
          style: const TextStyle(
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
    this.releaseYear,
  });

  final String? releaseYear;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: margin_large),
      height: marginXXLarge,
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(marginXLarge)),
      child: Center(
        child: Text(
          releaseYear ?? "",
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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

  const MovieDetailsBackButtonView(this.onTapBack, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: marginXLarge, left: margin_medium_2),
      child: GestureDetector(
        onTap: () {
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
    required this.imageString,
  });

  final String? imageString;

  @override
  Widget build(BuildContext context) {
    return
    //   Image.network(
    //   "$IMAGE_BASE_URL$imageString",
    //   fit: BoxFit.cover,
    // );
      CachedNetworkImage(
        imageUrl: "$IMAGE_BASE_URL$imageString",
        fit: BoxFit.cover,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
  }
}
