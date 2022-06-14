import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gomumovie/domain/entities/gomu_movie_entity.dart';
import 'package:gomumovie/domain/usecases/get_gomu_movie_watchlist.dart';
import 'package:gomutv/domain/usecase/get_gomu_tv_watchlist_case.dart';
import 'package:meta/meta.dart';

part 'gomu_movie_watchlist_event.dart';
part 'gomu_movie_watchlist_state.dart';

class GomuMovieWatchlistBloc
    extends Bloc<GomuMovieWatchlistEvent, GomuMovieWatchlistState> {
  // Declarate Variable
  static const String gomuMovieAddSuccess = 'Success add to watchlist';

  static const String gomuMovieRemoveSuccess = 'Success remove from watchlist';

  final GetGomuflixMovieWatchlistCase getGomuMovieWatchlistCase;

  final GetGomuflixMovieWatchlistStatusCase getGomuMovieWatchlistStatusCase;

  final SaveGomuflixMoviewatchlist saveGomuMovieWatchlistCase;

  final RemoveGomuflixMoviewatchlist removeGomuMovieWatchlistCase;

  GomuMovieWatchlistBloc(
      this.getGomuMovieWatchlistCase,
      this.getGomuMovieWatchlistStatusCase,
      this.saveGomuMovieWatchlistCase,
      this.removeGomuMovieWatchlistCase)
      : super(GomuMovieWatchlistInitial()) {
    // Get Watchlist
    on<GomuMovieGetListEvent>((event, emit) async {
      // Loading
      emit(GomuMovieWatchlistLoading());

      // Declrate Variables
      final result = await getGomuMovieWatchlistCase.watchlistAction();

      // Result Check
      result.fold((failure) {
        emit(GomuMovieWatchlistError(failure.message));
      }, (success) {
        success.isEmpty
            ? emit(GomuMovieWatchlistInitial())
            : emit(GomuMovieWatchlistLoaded(success));
      });
    });

    // Get Watchlist Status
    on<GomuMovieGetStatusEvent>(
      (event, emit) async {
        // Loading
        emit(GomuMovieWatchlistLoading());

        // Declrate Variables
        final result = await getGomuMovieWatchlistStatusCase.execute(event.id);

        // Result Check
        emit(GomuMovieStatusLoaded(result));
      },
    );

    // Add Watchlist
    on<GomuMovieSaveEvent>(
      (event, emit) async {
        // Declrate Variables
        final result = await saveGomuMovieWatchlistCase
            .saveWatchlisAction(event.gomuMovieDetail);

        // Result Check
        result.fold(
          (failure) {
            emit(GomuMovieWatchlistError(failure.message));
          },
          (success) {
            emit(GomuMovieSuccess(gomuMovieAddSuccess));
          },
        );
      },
    );

    // Remove Watchlist
    on<GomuMovieRemoveEvent>(
      (event, emit) async {
        // Declrate Variables
        final result = await removeGomuMovieWatchlistCase
            .removeWatchlisAction(event.gomuMovieDetail);

        // Result Check
        result.fold(
          (failure) {
            emit(GomuMovieWatchlistError(failure.message));
          },
          (success) {
            emit(GomuMovieSuccess(gomuMovieRemoveSuccess));
          },
        );
      },
    );
  }
}
