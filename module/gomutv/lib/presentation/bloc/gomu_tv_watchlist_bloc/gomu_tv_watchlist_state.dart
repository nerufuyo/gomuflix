part of 'gomu_tv_watchlist_bloc.dart';

@immutable
abstract class GomuTvWatchlistState extends Equatable {
  const GomuTvWatchlistState();

  @override
  List<Object> get props => [];
}

class GomuTvWatchlistInitial extends GomuTvWatchlistState {
  final String message = 'Initializing...';
}

class GomuTvWatchlistLoading extends GomuTvWatchlistState {
  final String message = 'Loading...';
}

class GomuTvWatchlistLoaded extends GomuTvWatchlistState {
  final List<GomuflixTvEntity> gomuTvList;

  GomuTvWatchlistLoaded(this.gomuTvList);

  @override
  List<Object> get props => [gomuTvList];
}

class GomuTvWatchlistError extends GomuTvWatchlistState {
  final String message;

  GomuTvWatchlistError(this.message);

  @override
  List<Object> get props => [message];
}

class GomuTvSuccess extends GomuTvWatchlistState {
  final String message;

  GomuTvSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class GomuTvStatusLoaded extends GomuTvWatchlistState {
  final bool isWatchlist;

  GomuTvStatusLoaded(this.isWatchlist);

  @override
  List<Object> get props => [isWatchlist];
}
