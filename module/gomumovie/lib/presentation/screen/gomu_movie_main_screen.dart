import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GomuflixMovieMainScreen extends StatefulWidget {
  static const routeName = '/gomuflix-movie-main-screen';

  const GomuflixMovieMainScreen({Key? key}) : super(key: key);

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
          ..syncGomuMovieNowPlaying()
          ..syncGomuMoviePopular()
          ..syncGomuMovieTopRated());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GomuflixDrawerWidget(),
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
                    'MOVIE',
                    style: nameText,
                  ),
                  const TitleGreyLine()
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const TitleRedLine(),
                      const TitleDivider(),
                      Text(
                        'Now Playing',
                        style: subTitleText,
                      ),
                    ],
                  ),
                  const ContentDivider(),
                  Consumer<GomuflixMovieListNotifier>(
                    builder: (context, data, child) {
                      final state = data.gomuMovieNowPlayingState;
                      if (state == RequestState.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state == RequestState.loaded) {
                        return GomuflixMovieList(data.nowPlayingMovies);
                      } else {
                        return Center(
                          key: const Key('error_message'),
                          child: Text(
                            data.message,
                            style: subNameText,
                          ),
                        );
                      }
                    },
                  ),
                  const ContentDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const TitleRedLine(),
                          const TitleDivider(),
                          Text(
                            'Popular',
                            style: subTitleText,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, GomuflixMoviePopularScreen.ROUTE_NAME);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: lightRedColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              'See all',
                              style: subNameText,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const ContentDivider(),
                  Consumer<GomuflixMovieListNotifier>(
                    builder: (context, data, child) {
                      final state = data.gomuMoviePopularState;
                      if (state == RequestState.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state == RequestState.loaded) {
                        return GomuflixMovieList(data.popularMovies);
                      } else {
                        return Center(
                          key: const Key('error_message'),
                          child: Text(
                            data.message,
                            style: subNameText,
                          ),
                        );
                      }
                    },
                  ),
                  const ContentDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, GomuflixMovieTopRatedScreen.ROUTE_NAME);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: lightRedColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              'See all',
                              style: subNameText,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const ContentDivider(),
                  Consumer<GomuflixMovieListNotifier>(
                    builder: (context, data, child) {
                      final state = data.gomuMovieTopRatedState;
                      if (state == RequestState.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state == RequestState.loaded) {
                        return GomuflixMovieList(data.topRatedMovies);
                      } else {
                        return Center(
                          key: const Key('error_message'),
                          child: Text(
                            data.message,
                            style: subNameText,
                          ),
                        );
                      }
                    },
                  ),
                  const ContentDivider(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
