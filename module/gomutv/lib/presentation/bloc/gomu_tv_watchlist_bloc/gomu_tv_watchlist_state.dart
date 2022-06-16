part of 'gomu_tv_watchlist_bloc.dart';

@immutable
abstract class GomuTvWatchlistState extends Equatable {
  const GomuTvWatchlistState();

  @override
  List<Object> get props => [];
}

// Tv Watchlist State
class GomuTvWatchlistInitial extends GomuTvWatchlistState {
  final String message = 'Initializing...';
}

// Tv Watchlist Loading
class GomuTvWatchlistLoading extends GomuTvWatchlistState {
  final String message = 'Loading...';
}

// Tv Watchlist Loaded
class GomuTvWatchlistLoaded extends GomuTvWatchlistState {
  final List<GomuflixTvEntity> gomuTvList;

  GomuTvWatchlistLoaded(this.gomuTvList);

  @override
  List<Object> get props => [gomuTvList];
}

// Tv Watchlist Error
class GomuTvWatchlistError extends GomuTvWatchlistState {
  final String message;

  GomuTvWatchlistError(this.message);

  @override
  List<Object> get props => [message];
}

// Tv Watchlist Success
class GomuTvSuccess extends GomuTvWatchlistState {
  final String message;

  GomuTvSuccess(this.message);

  @override
  List<Object> get props => [message];
}

// Tv Watchlist Status Loaded
class GomuTvStatusLoaded extends GomuTvWatchlistState {
  final bool isWatchlist;

  GomuTvStatusLoaded(this.isWatchlist);

  @override
  List<Object> get props => [isWatchlist];
}
