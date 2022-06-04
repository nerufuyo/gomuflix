import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GomuflixMovieDetailNotifier extends ChangeNotifier {
  // Declarate Variable

  GetGomuflixMovieDetailCase getGomuMovieDetail;

  GetGomuflixMovieDetailCase getGomuMovieRecommendation;

  GetGomuflixMovieWatchlistCase getGomuMovieWatchlistStatus;

  SaveGomuflixMoviewatchlist saveGomuMovieWatchlist;

  RemoveGomuflixMoviewatchlist removeGomuMovieWatchlist;

  late GomuflixMovieDetailEntity gomuMovieEntity;

  static const watchlistAddSuccessMessage = 'Added to Watchlist';

  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  bool _isAddedtoWatchlist = false;

  List<GomuflixMovieEntity> movieRecommendationsVar = [];

  RequestState stateVar = RequestState.empty;

  String messageVar = '';

  // Callback Variable
  GomuflixMovieDetailNotifier(
      {required this.getGomuMovieDetail,
      required this.getGomuMovieRecommendation,
      required this.getGomuMovieWatchlistStatus,
      required this.saveGomuMovieWatchlist,
      required this.removeGomuMovieWatchlist});

  // Get Value
  bool get isAddedToWatchlist => _isAddedtoWatchlist;

  GomuflixMovieDetailEntity get movie => gomuMovieEntity;

  List<GomuflixMovieEntity> get movieRecommendations => movieRecommendationsVar;

  RequestState get movieState => stateVar;

  RequestState get recommendationState => stateVar;

  String get message => messageVar;

  String get watchlistMessage => messageVar;

  // Sync Movie Detail
  Future<void> syncGomuMovieDetail(int id) async {
    // Declare Variable
    final detailResult = await getGomuMovieDetail.detailAction(id);

    final recommendationResult =
        await getGomuMovieRecommendation.recommendationAction(id);

    stateVar = RequestState.loading;

    notifyListeners();

    // Result Value
    detailResult.fold(
      (failure) {
        stateVar = RequestState.error;
        messageVar = failure.message;
        notifyListeners();
      },
      (movie) {
        stateVar = RequestState.loading;
        gomuMovieEntity = movie;
        notifyListeners();
        recommendationResult.fold(
          (failure) {
            stateVar = RequestState.error;
            messageVar = failure.message;
          },
          (movies) {
            stateVar = RequestState.loaded;
            movieRecommendationsVar = movies;
          },
        );
        stateVar = RequestState.loaded;
        notifyListeners();
      },
    );
  }

  // Load Watchlist Status
  Future<void> loadWatchlistStatus(int id) async {
    final result = await getGomuMovieWatchlistStatus.execute(id);
    _isAddedtoWatchlist = result;

    notifyListeners();
  }

  // Sync Movie Add WAtchlist
  Future<void> syncGomuMovieAddWatchlist(
      GomuflixMovieDetailEntity movie) async {
    //Declarate Variable
    final result = await saveGomuMovieWatchlist.saveWatchlisAction(movie);

    // Result Value
    await result.fold(
      (failure) async {
        messageVar = failure.message;
      },
      (successMessage) async {
        messageVar = successMessage;
      },
    );

    await loadWatchlistStatus(movie.id);
  }

  // Sync Movie Remove Watchlist
  Future<void> syncGomuMovieRemoveWatchlist(
      GomuflixMovieDetailEntity movie) async {
    // Declarate Variable
    final result = await removeGomuMovieWatchlist.removeWatchlisAction(movie);

    // Result Value
    await result.fold(
      (failure) async {
        messageVar = failure.message;
      },
      (successMessage) async {
        messageVar = successMessage;
      },
    );

    await loadWatchlistStatus(movie.id);
  }
}
