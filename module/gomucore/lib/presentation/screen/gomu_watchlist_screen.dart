import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:gomutv/gomutv.dart';
import 'package:provider/provider.dart';

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

    Future.microtask(() =>
        Provider.of<GomuflixMovieListNotifier>(context, listen: false)
            .syncGomuMovieWatchlist());
  }

  @override
  void didPopNext() {
    context.read<GomuTvWatchlistBloc>().add(GomuTvGetListEvent());
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
          Consumer<GomuflixMovieListNotifier>(
            builder: (context, data, child) {
              final watchlistState = data.state;
              if (watchlistState == RequestState.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data.state == RequestState.loaded) {
                return GomuflixMovieList(data.watchlistMovies);
              } else if (data.state == RequestState.empty) {
                return Center(
                  child: Text(
                    'Your Watchlist is Empty',
                    style: subNameText,
                  ),
                );
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
              } else {
                return const Center(
                  key: Key('error_message'),
                  child: Text('Something went wrong'),
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
