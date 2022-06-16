import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:gomutv/gomutv.dart';

class GomuflixWatchlistScreen extends StatefulWidget {
  const GomuflixWatchlistScreen({Key? key}) : super(key: key);

  static const routeName = '/gomuflix-watchlist-screen';

  @override
  GomuflixWatchlistScreenState createState() => GomuflixWatchlistScreenState();
}

class GomuflixWatchlistScreenState extends State with RouteAware {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<GomuTvWatchlistBloc>().add(GomuTvGetListEvent());
    });

    Future.microtask(() {
      context.read<GomuMovieWatchlistBloc>().add(GomuMovieGetListEvent());
    });
  }

  @override
  void didPopNext() {
    context.read<GomuTvWatchlistBloc>().add(GomuTvGetListEvent());

    context.read<GomuMovieWatchlistBloc>().add(GomuMovieGetListEvent());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: lightRedColor,
            size: 30,
          ),
        ),
        title: Text(
          'Watchlist',
          style: titleText,
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const TitleGreyLine(),
              Text(
                'MOVIES WATCHLIST',
                style: nameText,
              ),
              const TitleGreyLine()
            ],
          ),
          BlocBuilder<GomuMovieWatchlistBloc, GomuMovieWatchlistState>(
            builder: (context, state) {
              if (state is GomuMovieWatchlistLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GomuMovieWatchlistLoaded) {
                return GomuflixMovieList(state.gomuMovieList);
              } else if (state is GomuMovieWatchlistError) {
                return const Center(
                  key: Key('error_message'),
                  child: Text('Something went wrong'),
                );
              } else {
                return SizedBox(
                  height: 240,
                  child: Center(
                    child: Text(
                      'Wathclist is empty',
                      style: subNameText,
                    ),
                  ),
                );
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const TitleGreyLine(),
              Text(
                'TELEVISION WATCHLIST',
                style: nameText,
              ),
              const TitleGreyLine()
            ],
          ),
          BlocBuilder<GomuTvWatchlistBloc, GomuTvWatchlistState>(
            builder: (context, state) {
              if (state is GomuTvWatchlistLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GomuTvWatchlistLoaded) {
                return GomuflixTvList(state.gomuTvList);
              } else if (state is GomuTvWatchlistError) {
                return const Center(
                  key: Key('error_message'),
                  child: Text('Something went wrong'),
                );
              } else {
                return SizedBox(
                  height: 240,
                  child: Center(
                    child: Text(
                      'Wathclist is empty',
                      style: subNameText,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    routeObserver.unsubscribe(this);
  }
}
