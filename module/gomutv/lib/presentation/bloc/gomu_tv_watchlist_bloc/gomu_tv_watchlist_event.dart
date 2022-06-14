part of 'gomu_tv_watchlist_bloc.dart';

@immutable
class GomuTvWatchlistEvent extends Equatable {
  const GomuTvWatchlistEvent();

  @override
  List<Object> get props => [];
}

class GomuTvGetListEvent extends GomuTvWatchlistEvent {
  GomuTvGetListEvent();

  @override
  List<Object> get props => [];
}

class GomuTvWatchlistEventLoadWatchlistStatus extends GomuTvWatchlistEvent {
  final int id;

  GomuTvWatchlistEventLoadWatchlistStatus(this.id);

  @override
  List<Object> get props => [id];
}

class GomuTvWatchlistEventAddToWatchlist extends GomuTvWatchlistEvent {
  final GomuflixTvDetailEntity gomuTvDetail;

  GomuTvWatchlistEventAddToWatchlist(this.gomuTvDetail);

  @override
  List<Object> get props => [gomuTvDetail];
}

class GomuTvWatchlistEventRemoveFromWatchlist extends GomuTvWatchlistEvent {
  final GomuflixTvDetailEntity gomuTvDetail;

  GomuTvWatchlistEventRemoveFromWatchlist(this.gomuTvDetail);

  @override
  List<Object> get props => [gomuTvDetail];
}
