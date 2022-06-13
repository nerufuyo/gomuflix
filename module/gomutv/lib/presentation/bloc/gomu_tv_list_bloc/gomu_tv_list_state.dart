part of 'gomu_tv_list_bloc.dart';

@immutable
abstract class GomuTvListState extends Equatable {
  const GomuTvListState();

  @override
  List<Object> get props => [];
}

// Initial State
class GomuTvListInitial extends GomuTvListState {}

// Loading State
class GomuTvListLoading extends GomuTvListState {}

// Loaded State
class GomuTvListLoaded extends GomuTvListState {
  // Declarate Variable
  final List<GomuflixTvEntity> gomuTvs;

  // Callback Variable
  GomuTvListLoaded(this.gomuTvs);

  @override
  List<Object> get props => [gomuTvs];
}

// Error State
class GomuTvListError extends GomuTvListState {
  // Declarate Variable
  final String errorMessage;

  // Callback Variable
  GomuTvListError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
