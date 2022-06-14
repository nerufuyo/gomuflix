import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gomucore/common/static.dart';
import 'package:gomumovie/domain/entities/gomu_movie_entity.dart';
import 'package:gomumovie/domain/usecases/get_gomu_movie_detail_case.dart';
import 'package:meta/meta.dart';

part 'gomu_movie_detail_event.dart';
part 'gomu_movie_detail_state.dart';

// Movie Detail Bloc
class GomuMovieDetailBloc
    extends Bloc<GomuMovieDetailEvent, GomuMovieDetailState> {
  // Declarate Variables
  final GetGomuflixMovieDetailCase getGomuMovieDetailCase;

  GomuMovieDetailBloc(this.getGomuMovieDetailCase)
      : super(GomuMovieDetailInitial()) {
    on<GomuMovieDetailEvent>((event, emit) async {
      emit(GomuMovieDetailLoading());

      // Get Gomu Movie Detail
      final detailResult = await getGomuMovieDetailCase.detailAction(event.id);

      // Check Result
      detailResult.fold(
        // On Failure
        (FailureCondition failure) =>
            emit(GomuMovieDetailError(failure.message)),

        // On Success
        (GomuflixMovieDetailEntity success) =>
            emit(GomuMovieDetailLoaded(success)),
      );
    });
  }
}

// Movie Recommendation Bloc
class GomuMovieRecommendationBloc
    extends Bloc<GomuMovieDetailEvent, GomuMovieDetailState> {
  // Declarate Variables
  final GetGomuflixMovieDetailCase getGomuMovieDetailCase;

  GomuMovieRecommendationBloc(this.getGomuMovieDetailCase)
      : super(GomuMovieDetailInitial()) {
    on<GomuMovieDetailEvent>((event, emit) async {
      emit(GomuMovieDetailLoading());

      // Get Gomu Movie Detail
      final detailResult =
          await getGomuMovieDetailCase.recommendationAction(event.id);

      // Check Result
      detailResult.fold(
        // On Failure
        (FailureCondition failure) =>
            emit(GomuMovieDetailError(failure.message)),

        // On Success
        (List<GomuflixMovieEntity> success) =>
            emit(GomuMovieRecommendationLoaded(success)),
      );
    });
  }
}
