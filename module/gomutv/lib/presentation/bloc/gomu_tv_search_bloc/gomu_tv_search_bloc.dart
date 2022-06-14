import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gomutv/gomutv.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'gomu_tv_search_event.dart';
part 'gomu_tv_search_state.dart';

class GomuTvSearchBloc extends Bloc<GomuTvSearchEvent, GomuTvSearchState> {
  final SearchGomuflixTvCase searchGomuflixTvCase;

  GomuTvSearchBloc(this.searchGomuflixTvCase) : super(GomuTvSearchInitial('')) {
    // Initialize
    on<GomuTvSearchEventSearch>(
      (event, emit) async {
        emit(GomuTvSearchLoading());

        // Declarate Variable
        final result = await searchGomuflixTvCase.execute(event.query);

        // Check Result
        result.fold((failure) => emit(GomuTvSearchError(failure.message)),
            (success) {
          emit(GomuTvSearchLoaded(success));
          if (success.isEmpty) {
            emit(GomuTvSearchInitial('No Result'));
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
