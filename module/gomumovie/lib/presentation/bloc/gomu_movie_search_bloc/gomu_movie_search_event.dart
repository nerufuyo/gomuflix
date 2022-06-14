part of 'gomu_movie_search_bloc.dart';

@immutable
abstract class GomuMovieSearchEvent extends Equatable {
  GomuMovieSearchEvent();

  @override
  List<Object> get props => [];
}

class GomuMovieSearchEventSearch extends GomuMovieSearchEvent {
  final String query;

  GomuMovieSearchEventSearch(this.query);

  @override
  List<Object> get props => [query];
}
