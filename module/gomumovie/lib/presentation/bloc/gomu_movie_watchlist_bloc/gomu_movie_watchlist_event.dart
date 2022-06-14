part of 'gomu_movie_watchlist_bloc.dart';

@immutable
class GomuMovieWatchlistEvent extends Equatable {
  const GomuMovieWatchlistEvent();

  @override
  List<Object> get props => [];
}

class GomuMovieGetListEvent extends GomuMovieWatchlistEvent {
  GomuMovieGetListEvent();

  @override
  List<Object> get props => [];
}

class GomuMovieGetStatusEvent extends GomuMovieWatchlistEvent {
  final int id;

  GomuMovieGetStatusEvent(this.id);

  @override
  List<Object> get props => [id];
}

class GomuMovieRemoveEvent extends GomuMovieWatchlistEvent {
  final GomuflixMovieDetailEntity gomuMovieDetail;

  GomuMovieRemoveEvent(this.gomuMovieDetail);

  @override
  List<Object> get props => [gomuMovieDetail];
}

class GomuMovieSaveEvent extends GomuMovieWatchlistEvent {
  final GomuflixMovieDetailEntity gomuMovieDetail;

  GomuMovieSaveEvent(this.gomuMovieDetail);

  @override
  List<Object> get props => [gomuMovieDetail];
}
