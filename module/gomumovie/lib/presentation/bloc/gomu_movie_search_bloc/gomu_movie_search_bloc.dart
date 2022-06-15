import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'gomu_movie_search_event.dart';
part 'gomu_movie_search_state.dart';

class GomuMovieSearchBloc
    extends Bloc<GomuMovieSearchEvent, GomuMovieSearchState> {
  final SearchGomuflixMovie searchGomuflixMovieCase;

  GomuMovieSearchBloc(this.searchGomuflixMovieCase)
      : super(GomuMovieSearchInitial('')) {
    // Initialize
    on<GomuMovieSearchEventSearch>(
      (event, emit) async {
        emit(GomuMovieSearchLoading());

        // Declarate Variable
        final result = await searchGomuflixMovieCase.execute(event.query);

        // Check Result
        result.fold((failure) => emit(GomuMovieSearchError(failure.message)),
            (success) {
          emit(GomuMovieSearchLoaded(success));
          if (success.isEmpty) {
            emit(GomuMovieSearchEmpty('No Result'));
          }
        });
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }
}

EventTransformer<MyEvent> debounce<MyEvent>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
