import 'package:gomucore/gomucore.dart';
import 'package:flutter/material.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:provider/provider.dart';

class GomuflixMovieDetailScreen extends StatefulWidget {
  static const routeName = '/detail-movie';

  final int id;
  const GomuflixMovieDetailScreen({required this.id, Key? key})
      : super(key: key);

  @override
  _GomuflixMovieDetailScreenState createState() =>
      _GomuflixMovieDetailScreenState();
}

class _GomuflixMovieDetailScreenState extends State<GomuflixMovieDetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<GomuflixMovieDetailNotifier>(context, listen: false)
          .syncGomuMovieDetail(widget.id);

      Provider.of<GomuflixMovieDetailNotifier>(context, listen: false)
          .loadWatchlistStatus(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GomuflixMovieDetailNotifier>(
        builder: (context, provider, child) {
          if (provider.movieState == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.movieState == RequestState.loaded) {
            return SafeArea(
              child: GomuflixMovieDetailWidget(
                provider.movie,
                provider.movieRecommendations,
                provider.isAddedToWatchlist,
              ),
            );
          } else {
            return Text(provider.message);
          }
        },
      ),
    );
  }
}
