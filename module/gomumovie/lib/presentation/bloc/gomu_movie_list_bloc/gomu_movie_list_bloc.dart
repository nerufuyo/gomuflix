import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gomucore/common/static.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:meta/meta.dart';

part 'gomu_movie_list_event.dart';
part 'gomu_movie_list_state.dart';

// On Air Movie List Bloc
class GomuMovieNowPlayingBloc
    extends Bloc<GomuMovieListEvent, GomuMovieListState> {
  //Declarate Variables
  final GetGomuflixMovieListCase getGomuflixMovieListCase;

  GomuMovieNowPlayingBloc(this.getGomuflixMovieListCase)
      : super(GomuMovieListInitial()) {
    on<GomuMovieListEvent>((event, emit) async {
      emit(GomuMovieListLoading());

      // Get On Going Movies
      final Either<FailureCondition, List<GomuflixMovieEntity>> onGoingResult =
          await getGomuflixMovieListCase.nowPlayingAction();

      // Result
      onGoingResult.fold(
        // On Failure
        (FailureCondition failure) => emit(GomuMovieListError(failure.message)),

        // On Success
        (List<GomuflixMovieEntity> gomuMovies) =>
            emit(GomuMovieListLoaded(gomuMovies)),
      );
    });
  }
}

// Popular Movie List Bloc
class GomuMoviePopularBloc
    extends Bloc<GomuMovieListEvent, GomuMovieListState> {
  //Declarate Variables
  final GetGomuflixMovieListCase getGomuflixMovieListCase;

  GomuMoviePopularBloc(this.getGomuflixMovieListCase)
      : super(GomuMovieListInitial()) {
    on<GomuMovieListEvent>((event, emit) async {
      emit(GomuMovieListLoading());

      // Get On Going Movies
      final Either<FailureCondition, List<GomuflixMovieEntity>> onGoingResult =
          await getGomuflixMovieListCase.popularAction();

      // Result
      onGoingResult.fold(
        // On Failure
        (FailureCondition failure) => emit(GomuMovieListError(failure.message)),

        // On Success
        (List<GomuflixMovieEntity> gomuMovies) =>
            emit(GomuMovieListLoaded(gomuMovies)),
      );
    });
  }
}

// Top Rated Movie List Bloc
class GomuMovieTopRatedBloc
    extends Bloc<GomuMovieListEvent, GomuMovieListState> {
  //Declarate Variables
  final GetGomuflixMovieListCase getGomuflixMovieListCase;

  GomuMovieTopRatedBloc(this.getGomuflixMovieListCase)
      : super(GomuMovieListInitial()) {
    on<GomuMovieListEvent>((event, emit) async {
      emit(GomuMovieListLoading());

      // Get On Going Movies
      final Either<FailureCondition, List<GomuflixMovieEntity>> onGoingResult =
          await getGomuflixMovieListCase.topRatedAction();

      // Result
      onGoingResult.fold(
        // On Failure
        (FailureCondition failure) => emit(GomuMovieListError(failure.message)),

        // On Success
        (List<GomuflixMovieEntity> gomuMovies) =>
            emit(GomuMovieListLoaded(gomuMovies)),
      );
    });
  }
}
