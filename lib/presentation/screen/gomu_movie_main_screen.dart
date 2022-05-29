import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gomuflix/common/static.dart';
import 'package:gomuflix/common/style.dart';
import 'package:gomuflix/domain/entities/gomu_entity.dart';
import 'package:gomuflix/presentation/provider/gomu_movie_list_notifier.dart';
import 'package:gomuflix/presentation/screen/gomu_search_screen.dart';
import 'package:gomuflix/presentation/screen/gomu_tv_main_screen.dart';
import 'package:gomuflix/presentation/widgets/gomu_constant_widget.dart';
import 'package:gomuflix/presentation/widgets/gomu_drawer_widget.dart';
import 'package:provider/provider.dart';

class GomuflixMovieMainScreen extends StatefulWidget {
  const GomuflixMovieMainScreen({Key? key}) : super(key: key);
  static const routeName = '/gomuflix-movies-main-screen';

  @override
  _GomuflixMovieMainScreenState createState() =>
      _GomuflixMovieMainScreenState();
}

class _GomuflixMovieMainScreenState extends State {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<GomuflixMovieListNotifier>(context, listen: false)
          ..fetchOnGoingMovies()
          ..fetchMostWathedMovies()
          ..fetchTopRatedMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GomuflixDrawerWidget(
        onTapGomuflixMoviesScreen: () {
          Navigator.pop(context);
        },
        onTapGomuflixTvScreen: () {
          Navigator.pushNamed(context, GomuflixTvMainScreen.routeName);
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'GOMUFLIX',
          style: superTitleText,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, GomuflixSearchScreen.routeName);
              },
              icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const TitleGreyLine(),
                  Text(
                    'MOVIES',
                    style: nameText,
                  ),
                  const TitleGreyLine()
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const TitleRedLine(),
                        const TitleDivider(),
                        Text(
                          'On Going',
                          style: subTitleText,
                        ),
                      ],
                    ),
                    const ContentDivider(),
                    Consumer<GomuflixMovieListNotifier>(
                      builder: (context, data, child) {
                        final state = data.onGoingMovieState;
                        if (state == RequestState.loading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state == RequestState.loaded) {
                          return GomuflixMovieList(data.onGoingMovies);
                        } else {
                          return const Text('Failed Load Data');
                        }
                      },
                    ),
                    const ContentDivider(),
                    Row(
                      children: [
                        const TitleRedLine(),
                        const TitleDivider(),
                        Text(
                          'Most Watched',
                          style: subTitleText,
                        ),
                      ],
                    ),
                    const ContentDivider(),
                    Consumer<GomuflixMovieListNotifier>(
                      builder: (context, data, child) {
                        final state = data.mostWatchedMoviesState;
                        if (state == RequestState.loading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state == RequestState.loaded) {
                          return GomuflixMovieList(data.mostWatchedMovies);
                        } else {
                          return const Text('Failed Load Data');
                        }
                      },
                    ),
                    const ContentDivider(),
                    Row(
                      children: [
                        const TitleRedLine(),
                        const TitleDivider(),
                        Text(
                          'Top Rated',
                          style: subTitleText,
                        ),
                      ],
                    ),
                    const ContentDivider(),
                    Consumer<GomuflixMovieListNotifier>(
                        builder: (context, data, child) {
                      final state = data.topRatedMoviesState;
                      if (state == RequestState.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state == RequestState.loaded) {
                        return GomuflixMovieList(data.topRatedMovies);
                      } else {
                        return const Text('Failed Load Data');
                      }
                    }),
                    const ContentDivider(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GomuflixMovieList extends StatelessWidget {
  final List<GomuflixMovieEntity> movies;

  const GomuflixMovieList(this.movies, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            width: 140,
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: CachedNetworkImage(
                      width: 180,
                      imageUrl: '$baseImageUrl${movie.posterPath}',
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Text(
                    movie.title.toString(),
                    style: nameText,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    movie.releaseDate.toString().substring(0, 4),
                    style: detailText,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
