import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:flutter/material.dart';

class GomuflixMovieListNotifier extends ChangeNotifier {
  // Declarate Variable
  GetGomuflixMovieListCase getNowPlayingMovies;

  GetGomuflixMovieListCase getPopularMovies;

  GetGomuflixMovieListCase getTopRatedMovies;

  GetGomuflixMovieWatchlistCase getWatchlistMovies;

  var nowPlayingMovieVar = <GomuflixMovieEntity>[];

  var popularMovieVar = <GomuflixMovieEntity>[];

  var topRatedMovieVar = <GomuflixMovieEntity>[];

  var watchlistMovieVar = <GomuflixMovieEntity>[];

  List<GomuflixMovieEntity> gomuMovie = [];

  RequestState state = RequestState.empty;

  String messageVar = '';

  // Callback Variable
  GomuflixMovieListNotifier(
      {required this.getNowPlayingMovies,
      required this.getPopularMovies,
      required this.getTopRatedMovies,
      required this.getWatchlistMovies});

  // Get Value
  List<GomuflixMovieEntity> get nowPlayingMovies => nowPlayingMovieVar;

  List<GomuflixMovieEntity> get popularMovies => popularMovieVar;

  List<GomuflixMovieEntity> get topRatedMovies => topRatedMovieVar;

  List<GomuflixMovieEntity> get watchlistMovies => watchlistMovieVar;

  List<GomuflixMovieEntity> get movie => gomuMovie;

  RequestState get gomuMovieNowPlayingState => state;

  RequestState get gomuMoviePopularState => state;

  RequestState get gomuMovieTopRatedState => state;

  RequestState get gomuMovieWatchlistState => state;

  String get message => messageVar;

  // Sync Movie Now Playing Notifier
  Future<void> syncGomuMovieNowPlaying() async {
    // Declarate Variable
    state = RequestState.loading;

    notifyListeners();

    final result = await getNowPlayingMovies.nowPlayingAction();

    // Result Value
    result.fold(
      (failure) {
        state = RequestState.error;

        messageVar = failure.message;

        notifyListeners();
      },
      (moviesData) {
        state = RequestState.loaded;

        nowPlayingMovieVar = moviesData;

        notifyListeners();
      },
    );
  }

  // Sync Movie Popular Notifier
  Future<void> syncGomuMoviePopular() async {
    // Declarate Variable
    state = RequestState.loading;

    notifyListeners();

    final result = await getPopularMovies.popularAction();

    // Result Value
    result.fold(
      (failure) {
        state = RequestState.error;

        messageVar = failure.message;

        notifyListeners();
      },
      (moviesData) {
        state = RequestState.loaded;

        popularMovieVar = moviesData;

        notifyListeners();
      },
    );
  }

  // Sync Movie Top Rated Notifier
  Future<void> syncGomuMovieTopRated() async {
    // Declarate Variable
    state = RequestState.loading;

    notifyListeners();

    final result = await getTopRatedMovies.topRatedAction();

    // Result Value
    result.fold(
      (failure) {
        state = RequestState.error;

        messageVar = failure.message;

        notifyListeners();
      },
      (moviesData) {
        state = RequestState.loaded;

        topRatedMovieVar = moviesData;

        notifyListeners();
      },
    );
  }

  // Sync Movie Watchlist Notifier
  Future<void> syncGomuMovieWatchlist() async {
    state = RequestState.loading;

    notifyListeners();

    final result = await getWatchlistMovies.watchlistAction();

    result.fold(
      (failure) {
        state = RequestState.error;

        messageVar = failure.message;

        notifyListeners();
      },
      (moviesData) {
        state = RequestState.loaded;

        watchlistMovieVar = moviesData;

        notifyListeners();
      },
    );
  }
}