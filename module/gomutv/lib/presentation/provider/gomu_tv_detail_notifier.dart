import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GomuflixTvDetailNotifier extends ChangeNotifier {
  // Declarate Variable
  GetGomuflixTvDetailCase getGomuTvDetail;

  GetGomuflixTvDetailCase getGomuTvRecommendation;

  GetGomuflixTvWatchlistCase getGomuTvWatchlistStatus;

  SaveGomuflixTvWatchlistCase saveGomuTvWatchlist;

  RemoveGomuflixTvWatchlistCase removeGomuTvWatchlist;

  late GomuflixTvDetailEntity gomuTvEntitiy;

  static const watchlistAddSuccessMessage = 'Added to Watchlist';

  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  bool _isAddedtoWatchlist = false;

  List<GomuflixTvEntity> gomuTvRecommendation = [];

  RequestState stateVar = RequestState.empty;

  String messageVar = '';

  // Callback Variable
  GomuflixTvDetailNotifier(
      {required this.getGomuTvDetail,
      required this.getGomuTvRecommendation,
      required this.getGomuTvWatchlistStatus,
      required this.saveGomuTvWatchlist,
      required this.removeGomuTvWatchlist});

  // Get Value to Variable
  bool get isAddedToWatchlist => _isAddedtoWatchlist;

  GomuflixTvDetailEntity get tv => gomuTvEntitiy;

  List<GomuflixTvEntity> get tvRecommendations => gomuTvRecommendation;

  RequestState get tvState => stateVar;

  RequestState get recommendationState => stateVar;

  String get message => messageVar;

  String get watchlistMessage => messageVar;

  // Sync Tv Detail Notifier
  Future<void> syncGomuTvDetail(int id) async {
    // Declarate Variable

    stateVar = RequestState.loading;

    notifyListeners();

    final detailResult = await getGomuTvDetail.detailAction(id);

    final recommendationResult =
        await getGomuTvRecommendation.recommendationAction(id);

    // Condition
    detailResult.fold(
      (failure) {
        stateVar = RequestState.error;

        messageVar = failure.message;

        notifyListeners();
      },
      (tv) {
        stateVar = RequestState.loading;

        gomuTvEntitiy = tv;

        notifyListeners();

        recommendationResult.fold(
          (failure) {
            stateVar = RequestState.error;

            messageVar = failure.message;
          },
          (tv) {
            stateVar = RequestState.loaded;

            gomuTvRecommendation = tv;
          },
        );
        stateVar = RequestState.loaded;

        notifyListeners();
      },
    );
  }

  // Load Watchlist Status
  Future<void> loadWatchlistStatus(int id) async {
    final result = await getGomuTvWatchlistStatus.watchlistStatusAction(id);

    _isAddedtoWatchlist = result;

    notifyListeners();
  }

  // Sync Add Watchlist Notifier
  Future<void> syncGomuTvAddWatchlist(GomuflixTvDetailEntity tv) async {
    // Declarate Variable
    final result = await saveGomuTvWatchlist.saveWatchlistAction(tv);

    // Condition
    await result.fold(
      (failure) async {
        messageVar = failure.message;
      },
      (successMessage) async {
        messageVar = successMessage;
      },
    );
    await loadWatchlistStatus(tv.id);
  }

  // Sync Remove Watchlist Notifier
  Future<void> syncGomuTvRemoveWatchlist(GomuflixTvDetailEntity tv) async {
    // Declarate Variable
    final result = await removeGomuTvWatchlist.removeWatchlistAction(tv);

    // Condition
    await result.fold(
      (failure) async {
        messageVar = failure.message;
      },
      (successMessage) async {
        messageVar = successMessage;
      },
    );
    await loadWatchlistStatus(tv.id);
  }
}
