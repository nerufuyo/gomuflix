part of 'gomu_movie_detail_bloc.dart';

@immutable
class GomuMovieDetailEvent extends Equatable {
  // Declarate Variables
  final int id;

  // Callback variable
  GomuMovieDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}
