import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';
import 'package:flutter/material.dart';

class GomuflixTvListNotifier extends ChangeNotifier {
  // Declarate Variable
  GetGomuflixTvListCase getGomuTvOnAirCase;

  GetGomuflixTvListCase getGomuTvPopularCase;

  GetGomuflixTvListCase getGomuTvTopRatedCase;

  GetGomuflixTvWatchlistCase getGomuTvWatchlistCase;

  var onAirTvVar = <GomuflixTvEntity>[];

  var popularTvVar = <GomuflixTvEntity>[];

  var topRatedTvVar = <GomuflixTvEntity>[];

  var watchlistTvVar = <GomuflixTvEntity>[];

  List<GomuflixTvEntity> gomuTv = [];

  RequestState state = RequestState.empty;

  String messageVar = '';

  // Callback Variable
  GomuflixTvListNotifier(
      {required this.getGomuTvOnAirCase,
      required this.getGomuTvPopularCase,
      required this.getGomuTvTopRatedCase,
      required this.getGomuTvWatchlistCase});

  // Get Value to Variable
  List<GomuflixTvEntity> get onAirTv => onAirTvVar;

  List<GomuflixTvEntity> get popularTv => popularTvVar;

  List<GomuflixTvEntity> get topRatedTv => topRatedTvVar;

  List<GomuflixTvEntity> get watchlistTv => watchlistTvVar;

  List<GomuflixTvEntity> get tv => gomuTv;

  RequestState get gomuTvOnAirState => state;

  RequestState get gomuTvPopularState => state;

  RequestState get gomuTvTopRatedState => state;

  RequestState get gomuTvWatchlistState => state;

  String get message => messageVar;

  // Sync Tv On Air Notifier
  Future<void> syncGomuTvOnAir() async {
    // Declarate Variable
    state = RequestState.loading;

    notifyListeners();

    final result = await getGomuTvOnAirCase.onAirAction();

    // Result Value
    result.fold(
      (failure) {
        state = RequestState.error;

        messageVar = failure.message;

        notifyListeners();
      },
      (gomuTvData) {
        state = RequestState.loaded;

        onAirTvVar = gomuTvData;

        notifyListeners();
      },
    );
  }

  // Sync Tv Popular Notifier
  Future<void> syncGomuTvPopular() async {
    // Declarate Variable
    state = RequestState.loading;

    notifyListeners();

    // Result Value
    final result = await getGomuTvPopularCase.popularAction();

    result.fold(
      (failure) {
        state = RequestState.error;

        messageVar = failure.message;

        notifyListeners();
      },
      (gomuTvData) {
        state = RequestState.loaded;

        popularTvVar = gomuTvData;

        notifyListeners();
      },
    );
  }

  // Sync Tv Top Rated Notifier
  Future<void> syncGomuTvTopRated() async {
    // Declarate Variable

    state = RequestState.loading;

    notifyListeners();

    final result = await getGomuTvTopRatedCase.topRatedAction();

    // Result Value
    result.fold(
      (failure) {
        state = RequestState.error;

        messageVar = failure.message;

        notifyListeners();
      },
      (gomuTvData) {
        state = RequestState.loaded;

        topRatedTvVar = gomuTvData;

        notifyListeners();
      },
    );
  }

  // Sync Tv Watchlist Notifier
  Future<void> syncGomuTvWatchlist() async {
    // Declare Variable

    state = RequestState.loading;

    notifyListeners();

    final result = await getGomuTvWatchlistCase.watchlistAction();

    // Result Value
    result.fold(
      (failure) {
        state = RequestState.error;

        messageVar = failure.message;

        notifyListeners();
      },
      (gomuTvData) {
        state = RequestState.loaded;

        watchlistTvVar = gomuTvData;

        notifyListeners();
      },
    );
  }
}
