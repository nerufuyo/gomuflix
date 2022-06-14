part of 'gomu_movie_detail_bloc.dart';

@immutable
abstract class GomuMovieDetailState extends Equatable {
  const GomuMovieDetailState();

  @override
  List<Object> get props => [];
}

// Initial State
class GomuMovieDetailInitial extends GomuMovieDetailState {}

// Loading State
class GomuMovieDetailLoading extends GomuMovieDetailState {}

// Loaded State
class GomuMovieDetailLoaded extends GomuMovieDetailState {
  final GomuflixMovieDetailEntity gomuMovieDetail;

  GomuMovieDetailLoaded(this.gomuMovieDetail);

  @override
  List<Object> get props => [gomuMovieDetail];
}

class GomuMovieRecommendationLoaded extends GomuMovieDetailState {
  final List<GomuflixMovieEntity> gomuMovieRecommendation;

  GomuMovieRecommendationLoaded(this.gomuMovieRecommendation);

  @override
  List<Object> get props => [gomuMovieRecommendation];
}

// Error State
class GomuMovieDetailError extends GomuMovieDetailState {
  final String errorMessage;

  GomuMovieDetailError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
