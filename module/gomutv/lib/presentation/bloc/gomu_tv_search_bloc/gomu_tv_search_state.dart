part of 'gomu_tv_search_bloc.dart';

@immutable
abstract class GomuTvSearchState extends Equatable {
  GomuTvSearchState();

  @override
  List<Object> get props => [];
}

// Initial state
class GomuTvSearchInitial extends GomuTvSearchState {
  final String message;

  GomuTvSearchInitial(this.message);

  @override
  List<Object> get props => [message];
}

// Loading state
class GomuTvSearchLoading extends GomuTvSearchState {}

// Error state
class GomuTvSearchError extends GomuTvSearchState {
  final String message;

  GomuTvSearchError(this.message);

  @override
  List<Object> get props => [message];
}

// Empty state
class GomuTvSearchEmpty extends GomuTvSearchState {
  final String message;

  GomuTvSearchEmpty(this.message);

  @override
  List<Object> get props => [message];
}

// Loaded state
class GomuTvSearchLoaded extends GomuTvSearchState {
  final List<GomuflixTvEntity> results;

  GomuTvSearchLoaded(this.results);

  @override
  List<Object> get props => [results];
}
