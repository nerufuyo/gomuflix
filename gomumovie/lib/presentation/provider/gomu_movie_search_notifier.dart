import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:flutter/foundation.dart';

class GomuflixMovieSearchNotifier extends ChangeNotifier {
  // Declarate Variable
  final SearchGomuflixMovie searchMovie;
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
    final result = await searchMovie.execute(query);
    stateVar = RequestState.loading;
    notifyListeners();

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
