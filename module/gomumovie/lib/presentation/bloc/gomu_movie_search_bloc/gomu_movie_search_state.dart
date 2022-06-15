part of 'gomu_movie_search_bloc.dart';

@immutable
abstract class GomuMovieSearchState extends Equatable {
  GomuMovieSearchState();

  @override
  List<Object> get props => [];
}

// Initial state
class GomuMovieSearchInitial extends GomuMovieSearchState {
  final String message;

  GomuMovieSearchInitial(this.message);

  @override
  List<Object> get props => [message];
}

// Loading state
class GomuMovieSearchLoading extends GomuMovieSearchState {}

// Error state
class GomuMovieSearchError extends GomuMovieSearchState {
  final String message;

  GomuMovieSearchError(this.message);

  @override
  List<Object> get props => [message];
}

// Empty state
class GomuMovieSearchEmpty extends GomuMovieSearchState {
  final String message;

  GomuMovieSearchEmpty(this.message);

  @override
  List<Object> get props => [message];
}

// Loaded state
class GomuMovieSearchLoaded extends GomuMovieSearchState {
  final List<GomuflixMovieEntity> results;

  GomuMovieSearchLoaded(this.results);

  @override
  List<Object> get props => [results];
}
