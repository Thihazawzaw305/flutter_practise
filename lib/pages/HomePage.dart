import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practise/data/models/movie_model.dart';
import 'package:flutter_practise/data/models/movie_model_impl.dart';
import 'package:flutter_practise/data/vos/actor_vo.dart';
import 'package:flutter_practise/data/vos/movie_vo.dart';
import 'package:flutter_practise/pages/MovieDetailsPage.dart';
import 'package:flutter_practise/resources/colors.dart';
import 'package:flutter_practise/resources/dimens.dart';
import 'package:flutter_practise/resources/string.dart';
import 'package:flutter_practise/viewItems/actors_and_creators_section_view.dart';
import 'package:flutter_practise/viewItems/banner_view.dart';
import 'package:flutter_practise/viewItems/see_more_text.dart';
import 'package:flutter_practise/viewItems/show_case_view.dart';
import 'package:flutter_practise/viewItems/titleText_with_see_more_view.dart';
import '../data/vos/genre_vo.dart';
import '../viewItems/movie_view.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final List<String> genreList = [
  //   "Action",
  //   "Comedy",
  //   "Horror",
  //   "Si-Fi",
  //   "Drama",
  //   "Anime",
  //   "Adventure",
  //   "Crime"
  // ];

  List<MovieVO>? nowPlayingMovies;

  List<MovieVO>? popularMovies;

  List<GenreVO>? genreList;

  List<MovieVO>? topRatedMovies;

  List<ActorVO>? actors;

  List<MovieVO>? movieByGenre;

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


    movieModel.getNowPlayingMovie(1).then((movieList) {
      setState(() {
        nowPlayingMovies = movieList;
      });
    }).catchError((onError) {
      debugPrint(onError.toString());
    });

    movieModel.getGenre().then((genres){
      setState(() {
        genreList = genres;

        _GetMovieByGenre(genreList?.first.id ?? 0);
      });
    }).catchError((onError) {
      debugPrint(onError.toString());
    });



    movieModel.getTopRatedMovies(1).then((movieList) {
      setState(() {
        topRatedMovies = movieList;
      });
    }).catchError((onError) {
      debugPrint(onError.toString());
    });

    movieModel.getActors().then((actorList) {
      setState(() {
        actors = actorList;
      });
    }).catchError((onError) {
      debugPrint(onError.toString());
    });


        super.initState();
  }

  void _GetMovieByGenre(int genreId) {

     movieModel.getMovieByGenre(genreId.toString()).then((movieList) {
      setState(() {
       movieByGenre = movieList;
      });
    }).catchError((onError) {
      debugPrint(onError.toString());
    });
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
                  onTapMovie: (movieId) => _navigateToMovieDetailsScreen(context, movieId!)),

              const SizedBox(height: margin_medium_2),
              const CheckMovieShowTime(),
              const SizedBox(height: margin_medium_2),
              GenreSectionView(
                  genreList: genreList ?? [],
                  moviesByGenre: movieByGenre ?? [],
                  onChooseGenre: (genreId){
                    if(genreId != null){
                      _GetMovieByGenre(genreId);
                    }
                  },
                  onTapMovie: (movieId) => _navigateToMovieDetailsScreen(context,movieId!)),
              const SizedBox(height: MARGIN_MEDIUM_2),
               ShowCasesSection(topRatedMovies: topRatedMovies?.take(10).toList(),),
              const SizedBox(height: marginLarge),
               ActorsAndCreatorSectionView(
                actorList: actors ??[],
                titleText: "BEST ACTORS",
                seeMoreText: "MORE ACTORS",
                seeMoreTextVisibility: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToMovieDetailsScreen(BuildContext context, int movieId) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MovieDetailsPage(movieId: movieId,)));
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
    super.key,  required this.topRatedMovies,
  });

  final List<MovieVO>? topRatedMovies ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: marginMedium2),
          child: TitleTextWithSeeMoreView(titleText: "SHOWCASE"),
        ),
        SizedBox(height: marginLarge),
        Container(
          height: 220,
          child: ListView(
            padding: EdgeInsets.only(left: margin_medium_2),
            scrollDirection: Axis.horizontal,
            children: topRatedMovies
                ?.map((movies) => ShowCaseView(topRatedMovie: movies)).
    toList() ?? [])
    )

   ] );

  }
}

class HorizontalMovieListView extends StatelessWidget {
  HorizontalMovieListView( {required this.movieList,required this.onTapMovie});

  final Function(int?) onTapMovie;
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
            return GestureDetector(
              onTap:() => onTapMovie(movieList?[index].id),
              child: MovieView(
                movie: movieList?[index],
              ),
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

  const GenreSectionView({super.key, required this.genreList, required this.moviesByGenre, required this.onChooseGenre,required this.onTapMovie});

  final List<GenreVO> genreList;
  final List<MovieVO> moviesByGenre;
  final Function(int?) onChooseGenre;
  final Function(int?) onTapMovie;




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
                        child: Text(genre.name ?? ""),
                      ))
                  .toList() ?? [],
              onTap: (index){

              onChooseGenre(genreList?[index].id ?? 0);

              },
            ),
          ),
        ),
        Container(
          padding:
              const EdgeInsets.only(bottom: MARGIN_MEDIUM_2, top: margin_large),
          color: PRIMARY_COLOR,
          child: HorizontalMovieListView(
            onTapMovie : (movieId) => onTapMovie(movieId),
              movieList: moviesByGenre,

                ),
        )
      ],
    );
  }
}
