import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';
import 'package:meta/meta.dart';

part 'gomu_tv_detail_event.dart';
part 'gomu_tv_detail_state.dart';

// Tv Detail
class GomuTvDetailBloc extends Bloc<GomuTvDetailEvent, GomuTvDetailState> {
  // Declarate Variable
  final GetGomuflixTvDetailCase getGomuflixTvDetailCase;

  // Callback Variable
  GomuTvDetailBloc(this.getGomuflixTvDetailCase)
      : super(GomuTvDetailInitial()) {
    on<GomuTvDetailEvent>((event, emit) async {
      emit(GomuTvDetailLoading());

      // Get Tv Detail Future
      final detailResult = await getGomuflixTvDetailCase.detailAction(event.id);

      // Result Check
      detailResult.fold(
        // On Failure
        (FailureCondition failure) => emit(GomuTvDetailError(failure.message)),

        // On Success
        (GomuflixTvDetailEntity gomuTvDetail) =>
            emit(GomuTvDetailLoaded(gomuTvDetail)),
      );
    });
  }
}

// Tv Recommendation
class GomuTvRecommendationBloc
    extends Bloc<GomuTvDetailEvent, GomuTvDetailState> {
  // Declarate Variable
  final GetGomuflixTvDetailCase getGomuflixTvDetailCase;

  // Callback Variable
  GomuTvRecommendationBloc(this.getGomuflixTvDetailCase)
      : super(GomuTvDetailInitial()) {
    on<GomuTvDetailEvent>((event, emit) async {
      emit(GomuTvDetailLoading());

      // Get Tv Recommendation Future
      final recommendationResult =
          await getGomuflixTvDetailCase.recommendationAction(event.id);

      // Result Check
      recommendationResult.fold(
        // On Failure
        (FailureCondition failure) => emit(GomuTvDetailError(failure.message)),

        // On Success
        (List<GomuflixTvEntity> gomuTvs) =>
            emit(GomuTvRecommendationLoaded(gomuTvs)),
      );
    });
  }
}
