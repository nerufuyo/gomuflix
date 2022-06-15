import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    Future.microtask(() =>
        Provider.of<GomuMovieNowPlayingBloc>(context, listen: false)
            .add(GomuMovieListEvent()));
    Future.microtask(() =>
        Provider.of<GomuMoviePopularBloc>(context, listen: false)
            .add(GomuMovieListEvent()));
    Future.microtask(() =>
        Provider.of<GomuMovieTopRatedBloc>(context, listen: false)
            .add(GomuMovieListEvent()));
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
                // FirebaseCrashlytics.instance.crash();
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
                  BlocBuilder<GomuMovieNowPlayingBloc, GomuMovieListState>(
                    builder: (context, state) {
                      if (state is GomuMovieListLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is GomuMovieListLoaded) {
                        return GomuflixMovieList(state.gomuMovies);
                      } else if (state is GomuMovieListError) {
                        return Center(
                          key: const Key('error_message'),
                          child: Text(state.errorMessage),
                        );
                      } else {
                        return Container();
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
                              context, GomuflixMoviePopularScreen.routeName);
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
                  BlocBuilder<GomuMoviePopularBloc, GomuMovieListState>(
                    builder: (context, state) {
                      if (state is GomuMovieListLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is GomuMovieListLoaded) {
                        return GomuflixMovieList(state.gomuMovies);
                      } else if (state is GomuMovieListError) {
                        return Center(
                          key: const Key('error_message'),
                          child: Text(state.errorMessage),
                        );
                      } else {
                        return Container();
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
                              context, GomuflixMovieTopRatedScreen.routeName);
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
                  BlocBuilder<GomuMovieTopRatedBloc, GomuMovieListState>(
                    builder: (context, state) {
                      if (state is GomuMovieListLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is GomuMovieListLoaded) {
                        return GomuflixMovieList(state.gomuMovies);
                      } else if (state is GomuMovieListError) {
                        return Center(
                          key: const Key('error_message'),
                          child: Text(state.errorMessage),
                        );
                      } else {
                        return Container();
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
