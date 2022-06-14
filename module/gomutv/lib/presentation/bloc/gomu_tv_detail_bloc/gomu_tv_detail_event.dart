part of 'gomu_tv_detail_bloc.dart';

@immutable
class GomuTvDetailEvent extends Equatable {
  // Declarate Variable
  final int id;

  // Callback Variable
  const GomuTvDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}
