import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';
import 'package:flutter/foundation.dart';

class GomuflixTvSearchNotifier extends ChangeNotifier {
  // Declarate Variable
  final SearchGomuflixTvCase searchTv;
  List<GomuflixTvEntity> _searchResult = [];
  RequestState stateVar = RequestState.empty;
  String messageVar = '';

  // Callback Variable
  GomuflixTvSearchNotifier({required this.searchTv});

  // Convert Variable to Value
  List<GomuflixTvEntity> get searchResult => _searchResult;
  RequestState get searchState => stateVar;
  String get message => messageVar;

  // Sync Search Tv Notifier
  Future<void> syncSearchTv(String query) async {
    // Declarate Variable
    final result = await searchTv.execute(query);
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