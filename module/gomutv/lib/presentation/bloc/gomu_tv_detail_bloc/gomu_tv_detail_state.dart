part of 'gomu_tv_detail_bloc.dart';

@immutable
abstract class GomuTvDetailState extends Equatable {
  const GomuTvDetailState();

  @override
  List<Object> get props => [];
}

// Initial State
class GomuTvDetailInitial extends GomuTvDetailState {}

// Loading State
class GomuTvDetailLoading extends GomuTvDetailState {}

// Loaded State
class GomuTvDetailLoaded extends GomuTvDetailState {
  // Declarate Variable

  final GomuflixTvDetailEntity gomuTvDetail;

  // Callback Variable
  GomuTvDetailLoaded(this.gomuTvDetail);

  @override
  List<Object> get props => [gomuTvDetail];
}

class GomuTvRecommendationLoaded extends GomuTvDetailState {
  // Declarate Variable
  final List<GomuflixTvEntity> gomuTvs;

  // Callback Variable
  GomuTvRecommendationLoaded(this.gomuTvs);

  @override
  List<Object> get props => [gomuTvs];
}

// Error State
class GomuTvDetailError extends GomuTvDetailState {
  // Declarate Variable
  final String errorMessage;

  // Callback Variable
  GomuTvDetailError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
