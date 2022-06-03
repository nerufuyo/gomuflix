import 'package:gomumovie/gomumovie.dart';
import 'package:gomutv/gomutv.dart';
import 'package:gomumovie/domain/usecases/get_gomu_movie_watchlist.dart'
    as rwMovie;
import 'package:gomumovie/domain/usecases/get_gomu_movie_watchlist.dart'
    as swMovie;
import 'package:gomutv/domain/usecase/get_gomu_tv_watchlist_case.dart' as rwTv;
import 'package:gomutv/domain/usecase/get_gomu_tv_watchlist_case.dart' as swTv;
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(
    () => GomuflixMovieListNotifier(
      getNowPlayingMovies: locator(),
      getPopularMovies: locator(),
      getTopRatedMovies: locator(),
      getWatchlistMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => GomuflixTvListNotifier(
      getGomuTvOnAirCase: locator(),
      getGomuTvPopularCase: locator(),
      getGomuTvTopRatedCase: locator(),
      getGomuTvWatchlistCase: locator(),
    ),
  );
  locator.registerFactory(
    () => GomuflixMovieDetailNotifier(
      getGomuMovieDetail: locator(),
      getGomuMovieRecommendation: locator(),
      getGomuMovieWatchlistStatus: locator(),
      saveGomuMovieWatchlist: locator(),
      removeGomuMovieWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => GomuflixTvDetailNotifier(
      getGomuTvDetail: locator(),
      getGomuTvRecommendation: locator(),
      getGomuTvWatchlistStatus: locator(),
      saveGomuTvWatchlist: locator(),
      removeGomuTvWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => GomuflixMovieSearchNotifier(
      searchMovie: locator(),
    ),
  );
  locator.registerFactory(
    () => GomuflixTvSearchNotifier(
      searchTv: locator(),
    ),
  );

  // use case
  locator.registerLazySingleton(() => GetGomuflixMovieListCase(locator()));
  locator.registerLazySingleton(() => GetGomuflixMovieDetailCase(locator()));
  locator.registerLazySingleton(() => SearchGomuflixMovie(locator()));
  locator.registerLazySingleton(() => GetGomuflixMovieWatchlistCase(locator()));
  locator.registerLazySingleton(
      () => swMovie.SaveGomuflixMoviewatchlist(locator()));
  locator.registerLazySingleton(
      () => rwMovie.RemoveGomuflixMoviewatchlist(locator()));

  locator.registerLazySingleton(() => GetGomuflixTvListCase(locator()));
  locator.registerLazySingleton(() => GetGomuflixTvDetailCase(locator()));
  locator.registerLazySingleton(() => SearchGomuflixTvCase(locator()));
  locator.registerLazySingleton(() => GetGomuflixTvWatchlistCase(locator()));
  locator
      .registerLazySingleton(() => swTv.SaveGomuflixTvWatchlistCase(locator()));
  locator.registerLazySingleton(
      () => rwTv.RemoveGomuflixTvWatchlistCase(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => GomuflixMovieRepositoryImpl(
      remoteMovieDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<GomuflixTvRepository>(
    () => GomuflixTvRepositoryImpl(
      remoteTvDatasource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<GomuflixMovieRemoteDatasource>(() =>
      MovieRemoteDataSourceImpl(client: locator(), databaseHelper: locator()));
  locator.registerLazySingleton<GomuflixTvRemoteApiDatasource>(() =>
      GomuflixTvRemoteApiDatasourceImpl(
          client: locator(), databaseHandlerVar: locator()));

  // helper
  locator.registerLazySingleton<GomuflixMovieDatasourceHandler>(
      () => GomuflixMovieDatasourceHandler());
  locator.registerLazySingleton<GomuflixTvDatasourceHandler>(
      () => GomuflixTvDatasourceHandler());

  // external
  locator.registerLazySingleton(() => http.Client());
}
