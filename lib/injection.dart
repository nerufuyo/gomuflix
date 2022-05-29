import 'package:gomuflix/data/database/gomu_database_handler.dart';
import 'package:gomuflix/data/database/gomu_movie_database_impl.dart';
import 'package:gomuflix/data/database/gomu_movie_remote_database.dart';
import 'package:gomuflix/domain/entities/gomu_remote_entities.dart.dart';
import 'package:gomuflix/domain/usecases/get_gomu_movie_detail_case.dart';
import 'package:gomuflix/domain/usecases/get_gomu_movie_most_watched_case.dart';
import 'package:gomuflix/domain/usecases/get_gomu_movie_on_going_case.dart';
import 'package:gomuflix/domain/usecases/get_gomu_movie_recommendation_case.dart';
import 'package:gomuflix/domain/usecases/get_gomu_movie_top_rated_case.dart';
import 'package:gomuflix/domain/usecases/get_gomu_movie_watchlist_case.dart';
import 'package:gomuflix/domain/usecases/search_gomu_movie_case.dart';
import 'package:gomuflix/presentation/provider/gomu_movie_list_notifier.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

// Declarate Variable
final locator = GetIt.instance;

// Impelementation
void init() {
  // Movies Provider
  locator.registerFactory(() => GomuflixMovieListNotifier(
      getGomuMovieOnGoingCase: locator(),
      getGomuMovieMostWatchedCase: locator(),
      getGomuMovieTopRatedCase: locator()));

  // Movies Usecase
  locator.registerLazySingleton(() => GetGomuMovieDetailCase(locator()));
  locator.registerLazySingleton(() => GetGomuMovieMostWatchedCase(locator()));
  locator.registerLazySingleton(() => GetGomuMovieOnGoingCase(locator()));
  locator
      .registerLazySingleton(() => GetGomuMovieRecommendationCase(locator()));
  locator.registerLazySingleton(() => GetGomuMovieTopRatedCase(locator()));
  locator.registerLazySingleton(() => GetGomuWatchlistMoviesCase(locator()));
  locator
      .registerLazySingleton(() => GetGomuWatchlistStatusMoviesCase(locator()));
  locator.registerLazySingleton(() => RemoveGomuWatchlistMoviesCase(locator()));
  locator.registerLazySingleton(() => SaveGomuWatchlistMoviesCase(locator()));
  locator.registerLazySingleton(() => SearchGomuMovieCase(locator()));

  // Movies Remote Entities
  locator.registerLazySingleton<GomuflixMoviesRemoteEntities>(() =>
      GomuflixMovieDatabaseImpl(
          remoteDatabase: locator(), localDatabase: locator()));

  // Movies Remote Database
  locator.registerLazySingleton<GomuflixMovieRemoteDatabase>(
      () => GomuflixMovieRemoteDatabaseImpl(client: locator()));
  locator.registerLazySingleton<GomuflixMovieLocalDatabase>(
      () => GomuflixMovieLocalDatabaseImpl(databaseHandler: locator()));

  // Movies Handler
  locator.registerLazySingleton<DatabaseHandler>(() => DatabaseHandler());

  // External
  locator.registerLazySingleton(() => http.Client());
}
