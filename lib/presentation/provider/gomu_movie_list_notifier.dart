import 'package:flutter/cupertino.dart';
import 'package:gomuflix/common/static.dart';
import 'package:gomuflix/domain/entities/gomu_entity.dart';
import 'package:gomuflix/domain/usecases/get_gomu_movie_most_watched_case.dart';
import 'package:gomuflix/domain/usecases/get_gomu_movie_on_going_case.dart';
import 'package:gomuflix/domain/usecases/get_gomu_movie_top_rated_case.dart';

class GomuflixMovieListNotifier extends ChangeNotifier {
  // Declarate Variable
  final GetGomuMovieOnGoingCase getGomuMovieOnGoingCase;
  final GetGomuMovieMostWatchedCase getGomuMovieMostWatchedCase;
  final GetGomuMovieTopRatedCase getGomuMovieTopRatedCase;

  // Callback Variable
  GomuflixMovieListNotifier(
      {required this.getGomuMovieOnGoingCase,
      required this.getGomuMovieMostWatchedCase,
      required this.getGomuMovieTopRatedCase});

  // Get State On Going Movies
  var _onGoingMovies = <GomuflixMovieEntity>[];
  List<GomuflixMovieEntity> get onGoingMovies => _onGoingMovies;

  RequestState _onGoingMovieState = RequestState.empty;
  RequestState get onGoingMovieState => _onGoingMovieState;

  // Get State Most Wathed Movies
  var _mostWathedMovies = <GomuflixMovieEntity>[];
  List<GomuflixMovieEntity> get mostWatchedMovies => _mostWathedMovies;

  RequestState _mostWatchedMoviesState = RequestState.empty;
  RequestState get mostWatchedMoviesState => _mostWatchedMoviesState;

  // Get State Top Rated Movies
  var _topRatedMovies = <GomuflixMovieEntity>[];
  List<GomuflixMovieEntity> get topRatedMovies => _topRatedMovies;

  RequestState _topRatedMoviesState = RequestState.empty;
  RequestState get topRatedMoviesState => _topRatedMoviesState;

  // Get Message
  String _message = '';
  String get message => _message;

  // Implementation On Going Movies
  Future<void> fetchOnGoingMovies() async {
    _onGoingMovieState = RequestState.loading;
    notifyListeners();

    final result = await getGomuMovieOnGoingCase.execute();
    result.fold(
      (failure) {
        _onGoingMovieState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (moviesData) {
        _onGoingMovieState = RequestState.loaded;
        _onGoingMovies = moviesData;
        notifyListeners();
      },
    );
  }

  // Implementation Most Watched Movies
  Future<void> fetchMostWathedMovies() async {
    _mostWatchedMoviesState = RequestState.loading;
    notifyListeners();

    final result = await getGomuMovieMostWatchedCase.execute();
    result.fold(
      (failure) {
        _mostWatchedMoviesState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (moviesData) {
        _mostWatchedMoviesState = RequestState.loaded;
        _mostWathedMovies = moviesData;
        notifyListeners();
      },
    );
  }

  // Implementation Top Rated Movies
  Future<void> fetchTopRatedMovies() async {
    _topRatedMoviesState = RequestState.loading;
    notifyListeners();

    final result = await getGomuMovieTopRatedCase.execute();
    result.fold(
      (failure) {
        _topRatedMoviesState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (moviesData) {
        _topRatedMoviesState = RequestState.loaded;
        _topRatedMovies = moviesData;
        notifyListeners();
      },
    );
  }
}
