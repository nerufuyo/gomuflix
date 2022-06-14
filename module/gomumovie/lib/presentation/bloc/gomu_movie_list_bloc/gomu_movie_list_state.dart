part of 'gomu_movie_list_bloc.dart';

@immutable
abstract class GomuMovieListState extends Equatable {
  const GomuMovieListState();

  @override
  List<Object> get props => [];
}

// Initial State
class GomuMovieListInitial extends GomuMovieListState {}

// Loading State
class GomuMovieListLoading extends GomuMovieListState {}

// Loaded State
class GomuMovieListLoaded extends GomuMovieListState {
  final List<GomuflixMovieEntity> gomuMovies;

  GomuMovieListLoaded(this.gomuMovies);

  @override
  List<Object> get props => [gomuMovies];
}

// Error State
class GomuMovieListError extends GomuMovieListState {
  final String errorMessage;

  GomuMovieListError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
