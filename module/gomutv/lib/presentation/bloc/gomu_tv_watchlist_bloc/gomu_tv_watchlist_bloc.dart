import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gomutv/domain/entities/gomu_tv_entity.dart';
import 'package:gomutv/domain/usecase/get_gomu_tv_watchlist_case.dart';
import 'package:meta/meta.dart';

part 'gomu_tv_watchlist_event.dart';
part 'gomu_tv_watchlist_state.dart';

// Get Watchlist
class GomuTvWatchlistBloc
    extends Bloc<GomuTvWatchlistEvent, GomuTvWatchlistState> {
  static const String gomuTvAddSuccess = 'Success add to watchlist';

  static const String gomuTvRemoveSuccess = 'Success remove from watchlist';

  final GetGomuflixTvWatchlistCase getGomuTvWatchlistCase;

  final GetGomuflixTvWatchlistStatusCase getGomuTvWatchlistStatusCase;

  final SaveGomuflixTvWatchlistCase saveGomuTvWatchlistCase;

  final RemoveGomuflixTvWatchlistCase removeGomuTvWatchlistCase;

  GomuTvWatchlistBloc(
      this.getGomuTvWatchlistCase,
      this.getGomuTvWatchlistStatusCase,
      this.saveGomuTvWatchlistCase,
      this.removeGomuTvWatchlistCase)
      : super(GomuTvWatchlistInitial()) {
    // Get Watchlist
    on<GomuTvGetListEvent>((event, emit) async {
      // Loading
      emit(GomuTvWatchlistLoading());

      // Declrate Variables
      final result = await getGomuTvWatchlistCase.watchlistAction();

      // Result Check
      result.fold((failure) {
        emit(GomuTvWatchlistError(failure.message));
      }, (success) {
        success.isEmpty
            ? emit(GomuTvWatchlistInitial())
            : emit(GomuTvWatchlistLoaded(success));
      });
    });

    // Get Watchlist Status
    on<GomuTvWatchlistEventLoadWatchlistStatus>(
      (event, emit) async {
        // Loading
        emit(GomuTvWatchlistLoading());

        // Declrate Variables
        final result =
            await getGomuTvWatchlistStatusCase.watchlistStatusAction(event.id);

        // Result Check
        emit(GomuTvStatusLoaded(result));
      },
    );

    // Add Watchlist
    on<GomuTvWatchlistEventAddToWatchlist>(
      (event, emit) async {
        // Declrate Variables
        final result = await saveGomuTvWatchlistCase
            .saveWatchlistAction(event.gomuTvDetail);

        // Result Check
        result.fold(
          (failure) {
            emit(GomuTvWatchlistError(failure.message));
          },
          (success) {
            emit(GomuTvSuccess(gomuTvAddSuccess));
          },
        );
      },
    );

    // Remove Watchlist
    on<GomuTvWatchlistEventRemoveFromWatchlist>(
      (event, emit) async {
        // Declrate Variables
        final result = await removeGomuTvWatchlistCase
            .removeWatchlistAction(event.gomuTvDetail);

        // Result Check
        result.fold(
          (failure) {
            emit(GomuTvWatchlistError(failure.message));
          },
          (success) {
            emit(GomuTvSuccess(gomuTvRemoveSuccess));
          },
        );
      },
    );
  }
}
