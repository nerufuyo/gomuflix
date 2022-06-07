import 'package:flutter/material.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:gomutv/gomutv.dart';
import 'package:provider/provider.dart';

class GomuflixWatchlistScreen extends StatefulWidget {
  const GomuflixWatchlistScreen({Key? key}) : super(key: key);
  static const routeName = '/gomuflix-watchlist-scren';

  @override
  _GomuflixWatchlistScreenState createState() =>
      _GomuflixWatchlistScreenState();
}

class _GomuflixWatchlistScreenState extends State {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<GomuflixTvListNotifier>(context, listen: false)
            .syncGomuTvWatchlist());
    Future.microtask(() =>
        Provider.of<GomuflixMovieListNotifier>(context, listen: false)
            .syncGomuMovieWatchlist());
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
      body: SingleChildScrollView(
        child: Column(
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
            Consumer<GomuflixTvListNotifier>(
              builder: (context, data, child) {
                final watchlistState = data.state;
                if (watchlistState == RequestState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (data.state == RequestState.loaded) {
                  return GomuflixTvList(data.watchlistTv);
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
          ],
        ),
      ),
    );
  }
}
