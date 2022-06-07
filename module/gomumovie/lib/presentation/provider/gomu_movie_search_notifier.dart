import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:flutter/foundation.dart';

class GomuflixMovieSearchNotifier extends ChangeNotifier {
  // Declarate Variable
  SearchGomuflixMovie searchMovie;

  List<GomuflixMovieEntity> _searchResult = [];

  RequestState stateVar = RequestState.empty;

  String messageVar = '';

  // Callback Variable
  GomuflixMovieSearchNotifier({required this.searchMovie});

  // Get Value
  List<GomuflixMovieEntity> get searchResult => _searchResult;

  RequestState get state => stateVar;

  String get message => messageVar;

  // Sync Search Movie Notifier
  Future<void> syncSearchMovie(String query) async {
    // Declarate Variable

    stateVar = RequestState.loading;

    notifyListeners();

    final result = await searchMovie.execute(query);

    // Result Value
    result.fold(
      (failure) {
        messageVar = failure.message;
        stateVar = RequestState.error;
        notifyListeners();
      },
      (data) {
        _searchResult = data;
        stateVar = RequestState.loaded;
        notifyListeners();
      },
    );
  }
}
