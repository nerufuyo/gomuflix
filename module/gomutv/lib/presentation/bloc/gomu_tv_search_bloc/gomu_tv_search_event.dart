part of 'gomu_tv_search_bloc.dart';

@immutable
abstract class GomuTvSearchEvent extends Equatable {
  GomuTvSearchEvent();

  @override
  List<Object> get props => [];
}

class GomuTvSearchEventSearch extends GomuTvSearchEvent {
  final String query;

  GomuTvSearchEventSearch(this.query);

  @override
  List<Object> get props => [query];
}
