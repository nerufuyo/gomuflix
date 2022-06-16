part of 'gomu_movie_watchlist_bloc.dart';

@immutable
abstract class GomuMovieWatchlistState extends Equatable {
  const GomuMovieWatchlistState();

  @override
  List<Object> get props => [];
}

// Movie Watchlist State
class GomuMovieWatchlistInitial extends GomuMovieWatchlistState {
  final String message = 'Initial';
}

// Movie Watchlist Loading
class GomuMovieWatchlistLoading extends GomuMovieWatchlistState {
  final String message = 'Loading';
}

// Movie Watchlist Loaded
class GomuMovieWatchlistLoaded extends GomuMovieWatchlistState {
  final List<GomuflixMovieEntity> gomuMovieList;

  GomuMovieWatchlistLoaded(this.gomuMovieList);

  @override
  List<Object> get props => [gomuMovieList];
}

// Movie Watchlist Error
class GomuMovieWatchlistError extends GomuMovieWatchlistState {
  final String message;

  GomuMovieWatchlistError(this.message);

  @override
  List<Object> get props => [message];
}

// Movie Watchlist Success
class GomuMovieSuccess extends GomuMovieWatchlistState {
  final String message;

  GomuMovieSuccess(this.message);

  @override
  List<Object> get props => [message];
}

// Movie Watchlist Status Loaded
class GomuMovieStatusLoaded extends GomuMovieWatchlistState {
  final bool isWatchlist;

  GomuMovieStatusLoaded(this.isWatchlist);

  @override
  List<Object> get props => [isWatchlist];
}
