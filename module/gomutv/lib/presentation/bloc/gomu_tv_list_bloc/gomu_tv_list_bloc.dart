import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/domain/entities/gomu_tv_entity.dart';
import 'package:gomutv/domain/usecase/get_gomu_tv_list_case.dart';
import 'package:meta/meta.dart';

part 'gomu_tv_list_event.dart';
part 'gomu_tv_list_state.dart';

// On Air
class GomuTvOnAirBloc extends Bloc<GomuTvListEvent, GomuTvListState> {
  // Declarate Variable
  final GetGomuflixTvListCase getGomuflixTvListCase;

  // Callback Variable
  GomuTvOnAirBloc(this.getGomuflixTvListCase) : super(GomuTvListInitial()) {
    on<GomuTvListEvent>((event, emit) async {
      emit(GomuTvListLoading());

      // Get On Air Tv Future
      final Either<FailureCondition, List<GomuflixTvEntity>> onAirResult =
          await getGomuflixTvListCase.onAirAction();

      // Result Check
      onAirResult.fold(
        // On Failure
        (FailureCondition failure) => emit(GomuTvListError(failure.message)),

        // On Success
        (List<GomuflixTvEntity> gomuTvs) => emit(GomuTvListLoaded(gomuTvs)),
      );
    });
  }
}

// Popular
class GomuTvPopularBloc extends Bloc<GomuTvListEvent, GomuTvListState> {
  // Declarate Variable
  final GetGomuflixTvListCase getGomuflixTvListCase;

  // Callback Variable
  GomuTvPopularBloc(this.getGomuflixTvListCase) : super(GomuTvListInitial()) {
    on<GomuTvListEvent>((event, emit) async {
      emit(GomuTvListLoading());

      // Get Popular Tv Future
      final Either<FailureCondition, List<GomuflixTvEntity>> popularResult =
          await getGomuflixTvListCase.popularAction();

      // Result Check

      popularResult.fold(
        // On Failure
        (FailureCondition failure) => emit(GomuTvListError(failure.message)),

        // On Success
        (List<GomuflixTvEntity> gomuTvs) => emit(GomuTvListLoaded(gomuTvs)),
      );
    });
  }
}

// Top Rated
class GomuTvTopRatedBloc extends Bloc<GomuTvListEvent, GomuTvListState> {
  // Declarate Variable
  final GetGomuflixTvListCase getGomuflixTvListCase;

  // Callback Variable
  GomuTvTopRatedBloc(this.getGomuflixTvListCase) : super(GomuTvListInitial()) {
    on<GomuTvListEvent>((event, emit) async {
      emit(GomuTvListLoading());

      // Get Top rated Tv Future
      final Either<FailureCondition, List<GomuflixTvEntity>> topRatedResult =
          await getGomuflixTvListCase.topRatedAction();

      // Result Check

      topRatedResult.fold(
        // On Failure
        (FailureCondition failure) => emit(GomuTvListError(failure.message)),

        // On Success
        (List<GomuflixTvEntity> gomuTvs) => emit(GomuTvListLoaded(gomuTvs)),
      );
    });
  }
}
