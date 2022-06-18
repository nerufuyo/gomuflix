import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:gomutv/gomutv.dart';
import 'package:gomumovie/domain/usecases/get_gomu_movie_watchlist.dart'
    as rwMovie;
import 'package:gomumovie/domain/usecases/get_gomu_movie_watchlist.dart'
    as swMovie;
import 'package:gomutv/domain/usecase/get_gomu_tv_watchlist_case.dart' as rwTv;
import 'package:gomutv/domain/usecase/get_gomu_tv_watchlist_case.dart' as swTv;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // Tv Bloc
  locator.registerFactory(() => GomuTvOnAirBloc(locator()));

  locator.registerFactory(() => GomuTvPopularBloc(locator()));

  locator.registerFactory(() => GomuTvTopRatedBloc(locator()));

  locator.registerFactory(() => GomuTvDetailBloc(locator()));

  locator.registerFactory(() => GomuTvRecommendationBloc(locator()));

  locator.registerFactory(
      () => GomuTvWatchlistBloc(locator(), locator(), locator(), locator()));

  locator.registerFactory(() => GomuTvSearchBloc(locator()));

  // Movie Bloc
  locator.registerFactory(() => GomuMoviePopularBloc(locator()));

  locator.registerFactory(() => GomuMovieTopRatedBloc(locator()));

  locator.registerFactory(() => GomuMovieNowPlayingBloc(locator()));

  locator.registerFactory(() => GomuMovieDetailBloc(locator()));

  locator.registerFactory(() => GomuMovieRecommendationBloc(locator()));

  locator.registerFactory(
      () => GomuMovieWatchlistBloc(locator(), locator(), locator(), locator()));

  locator.registerFactory(() => GomuMovieSearchBloc(locator()));

  // use case
  locator.registerLazySingleton(() => GetGomuflixMovieListCase(locator()));

  locator.registerLazySingleton(() => GetGomuflixMovieDetailCase(locator()));

  locator.registerLazySingleton(() => SearchGomuflixMovie(locator()));

  locator.registerLazySingleton(() => GetGomuflixMovieWatchlistCase(locator()));

  locator.registerLazySingleton(
      () => GetGomuflixMovieWatchlistStatusCase(locator()));

  locator.registerLazySingleton(
      () => swMovie.SaveGomuflixMoviewatchlist(locator()));

  locator.registerLazySingleton(
      () => rwMovie.RemoveGomuflixMoviewatchlist(locator()));

  locator.registerLazySingleton(() => GetGomuflixTvListCase(locator()));

  locator.registerLazySingleton(() => GetGomuflixTvDetailCase(locator()));

  locator.registerLazySingleton(() => SearchGomuflixTvCase(locator()));

  locator.registerLazySingleton(() => GetGomuflixTvWatchlistCase(locator()));

  locator
      .registerLazySingleton(() => GetGomuflixTvWatchlistStatusCase(locator()));

  locator
      .registerLazySingleton(() => swTv.SaveGomuflixTvWatchlistCase(locator()));

  locator.registerLazySingleton(
      () => rwTv.RemoveGomuflixTvWatchlistCase(locator()));

  // repository
  locator.registerLazySingleton<GomuflixMovieRepository>(
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
      GomuflixMovieRemoteDataSourceImpl(
          client: locator(), databaseHelper: locator()));

  locator.registerLazySingleton<GomuflixTvRemoteApiDatasource>(() =>
      GomuflixTvRemoteApiDatasourceImpl(
          client: locator(), databaseHandlerVar: locator()));

  // helper
  locator.registerLazySingleton<GomuflixMovieDatasourceHandler>(
      () => GomuflixMovieDatasourceHandler());

  locator.registerLazySingleton<GomuflixTvDatasourceHandler>(
      () => GomuflixTvDatasourceHandler());

  // external
  locator.registerLazySingleton(() => HttpSSLPiningHelper.client);
}
