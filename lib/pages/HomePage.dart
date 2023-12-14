import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practise/data/models/movie_model.dart';
import 'package:flutter_practise/data/models/movie_model_impl.dart';
import 'package:flutter_practise/data/vos/movie_vo.dart';
import 'package:flutter_practise/pages/MovieDetailsPage.dart';
import 'package:flutter_practise/resources/colors.dart';
import 'package:flutter_practise/resources/dimens.dart';
import 'package:flutter_practise/resources/string.dart';
import 'package:flutter_practise/viewItems/actor_item_view.dart';
import 'package:flutter_practise/viewItems/actors_and_creators_section_view.dart';
import 'package:flutter_practise/viewItems/banner_view.dart';
import 'package:flutter_practise/viewItems/see_more_text.dart';
import 'package:flutter_practise/viewItems/show_case_view.dart';
import 'package:flutter_practise/viewItems/titleText_with_see_more_view.dart';
import 'package:flutter_practise/viewItems/title_text_view.dart';
import '../viewItems/movie_view.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> genreList = [
    "Action",
    "Comedy",
    "Horror",
    "Si-Fi",
    "Drama",
    "Anime",
    "Adventure",
    "Crime"
  ];

  List<MovieVO>? nowPlayingMovies;

  List<MovieVO>? popularMovies;

  MovieModel movieModel = MovieModelImpl();

  @override
  void initState() {
    movieModel.getPopularMovie(1).then((popularMovieList) {
      setState(() {
        popularMovies = popularMovieList;
      });
    }).catchError((onError) {
      debugPrint(onError.toString());
    });
    super.initState();

    movieModel.getNowPlayingMovie(1).then((movieList) {
      setState(() {
        nowPlayingMovies = movieList;
      });
    }).catchError((onError) {
      debugPrint(onError.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        centerTitle: true,
        title: const Text(MAIN_SCREEN_APP_BAR_TITLE),
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: MARGIN_MEDIUM_2),
              child: Icon(Icons.search)

//
              ),
        ],
      ),
      body: Container(
        color: HOME_SCREEN_BACKGROUND_COLOR,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BannerSectionView(movieList: popularMovies?.take(5).toList(),),
              const SizedBox(height: margin_medium_2),
              Container(
                margin: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
                child: const Text(
                  "BEST POPULAR MOVIES AND SERIES",
                  style: TextStyle(
                      color: HOME_SCREEN_TITLE_LIST_COLOR,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: margin_medium_2),
              HorizontalMovieListView(
                  movieList: nowPlayingMovies,
                  () => _navigateToMovieDetailsScreen(context)),
              const SizedBox(height: margin_medium_2),
              const CheckMovieShowTime(),
              const SizedBox(height: margin_medium_2),
              GenreSectionView(
                  genreList: genreList,
                  () => _navigateToMovieDetailsScreen(context)),
              const SizedBox(height: MARGIN_MEDIUM_2),
              const ShowCasesSection(),
              const SizedBox(height: marginLarge),
              const ActorsAndCreatorSectionView(
                titleText: "SHOWCASES",
                seeMoreText: "MORE SHOWCASES",
                seeMoreTextVisibility: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToMovieDetailsScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MovieDetailsPage()));
  }
}

class CheckMovieShowTime extends StatelessWidget {
  const CheckMovieShowTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: margin_medium_2, vertical: margin_large),
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      color: PRIMARY_COLOR,
      height: 180,
      child: const Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Check Movie",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: textHeading1x,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Show Time",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: textHeading1x,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              SeeMoreText(
                text: "SEE MORE",
                textColor: Colors.amber,
              )
            ],
          ),
          Spacer(),
          Icon(
            Icons.location_on_rounded,
            size: 50,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class ShowCasesSection extends StatelessWidget {
  const ShowCasesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: TitleTextWithSeeMoreView(titleText: "SHOWCASE"),
        ),
        SizedBox(height: marginLarge),
        Container(
          height: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              ShowCaseView(),
              ShowCaseView(),
              ShowCaseView(),
            ],
          ),
        ),
      ],
    );
  }
}

class HorizontalMovieListView extends StatelessWidget {
  HorizontalMovieListView(this.onTapMovie, {required this.movieList});

  final Function onTapMovie;
  final List<MovieVO>? movieList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child:(movieList != null)?ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: MARGIN_MEDIUM_2, right: margin_medium),
          itemCount: movieList?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return MovieView(
              () {
                onTapMovie();
              },
              movie: movieList?[index],
            );
          })
          :const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class BannerSectionView extends StatefulWidget {
  const BannerSectionView({
    super.key,
    required this.movieList,
  });

  final List<MovieVO>? movieList;

  @override
  State<BannerSectionView> createState() => _BannerSectionViewState();
}

class _BannerSectionViewState extends State<BannerSectionView> {
  int _position = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: MediaQuery.of(context).size.height / 3.5,
        child: PageView(
            onPageChanged: (page) {
              setState(() {
                _position = page;
              });
            },
            children: widget.movieList
                    ?.map((movie) => BannerView(movie: movie))
                    .toList() ??
                []),
      ),
      SizedBox(height: MARGIN_MEDIUM_2),
      DotsIndicator(
        dotsCount: widget.movieList?.length ?? 1,
        position: _position,
        decorator: const DotsDecorator(
          color: HOME_SCREEN_DOT_INACTIVE_COLOR, // Inactive color
          activeColor: Colors.amber,
        ),
      )
    ]);
  }
}

class GenreSectionView extends StatelessWidget {
  final Function onTapMovie;

  const GenreSectionView(this.onTapMovie, {super.key, required this.genreList});

  final List<String> genreList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: margin_medium_2),
          child: DefaultTabController(
            length: genreList.length,
            child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.amber,
              unselectedLabelColor: HOME_SCREEN_TITLE_LIST_COLOR,
              tabs: genreList
                  .map((genre) => Tab(
                        child: Text(genre),
                      ))
                  .toList(),
            ),
          ),
        ),
        Container(
          padding:
              const EdgeInsets.only(bottom: MARGIN_MEDIUM_2, top: margin_large),
          color: PRIMARY_COLOR,
          child: HorizontalMovieListView(movieList: [], () {
            onTapMovie();
          }),
        )
      ],
    );
  }
}
