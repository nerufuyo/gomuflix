import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';
import 'package:flutter/foundation.dart';

class GomuflixTvSearchNotifier extends ChangeNotifier {
  // Declarate Variable
  SearchGomuflixTvCase searchTv;

  var foundSearchTv = <GomuflixTvEntity>[];

  List<GomuflixTvEntity> gomuTv = [];

  RequestState stateVar = RequestState.empty;

  String messageVar = '';

  // Callback Variable
  GomuflixTvSearchNotifier({required this.searchTv});

  // Convert Variable to Value
  List<GomuflixTvEntity> get searchResult => foundSearchTv;

  List<GomuflixTvEntity> get tvResult => gomuTv;

  RequestState get searchState => stateVar;

  String get message => messageVar;

  // Sync Search Tv Notifier
  Future<void> syncSearchTv(String query) async {
    // Declarate Variable

    stateVar = RequestState.loading;

    notifyListeners();

    final result = await searchTv.execute(query);

    // Result Value
    result.fold(
      (failure) {
        messageVar = failure.message;

        stateVar = RequestState.error;

        notifyListeners();
      },
      (data) {
        foundSearchTv = data;

        stateVar = RequestState.loaded;

        notifyListeners();
      },
    );
  }
}
