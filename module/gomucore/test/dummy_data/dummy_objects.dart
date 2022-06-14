import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:gomutv/domain/entities/gomu_tv_entity.dart';

// Movie Dummy Object
final testMovie = GomuflixMovieEntity(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final testMovieList = [testMovie];

final testMovieDetail = GomuflixMovieDetailEntity(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [GomuflixMovieGenreEntity(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

final testWatchlistMovie = GomuflixMovieEntity.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieTable = GomuflixMovieWatchlistModel(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

// Tv Dummy Object
final testTvSeries = GomuflixTvEntity(
  backdropPath: '/gFZriCkpJYsApPZEF3jhxL4yLzG.jpg',
  genreIds: [80, 18],
  id: 71446,
  originalName: 'Money Heist',
  overview:
      'To carry out the biggest heist in history, a mysterious man called The Professor recruits a band of eight robbers who have a single characteristic: none of them has anything to lose. Five months of seclusion - memorizing every step, every detail, every probability - culminate in eleven days locked up in the National Coinage and Stamp Factory of Spain, surrounded by police forces and with dozens of hostages in their power, to find out whether their suicide wager will lead to everything or nothing.',
  popularity: 906.295,
  posterPath: '/reEMJA1uzscCbkpeRJeTT2bjqUp.jpg',
  firstAirDate: '2017-05-02',
  name: 'Money Heist',
  voteAverage: 8.3,
  voteCount: 14669,
);

final testTvSeriesList = [testTvSeries];

final testTvSeriesDetail = GomuflixTvDetailEntity(
  backdropPath: 'backdropPath',
  genres: [GomuflixTvGenreEntity(id: 1, name: 'Action')],
  id: 1,
  originalName: 'originalName',
  overview: 'overview',
  posterPath: 'posterPath',
  firstAirDate: 'firstAirDate',
  name: 'name',
  numberOfEpisodes: 1,
  numberOfSeasons: 1,
  voteAverage: 1,
  voteCount: 1,
);

final testWatchlistTvSeries = GomuflixTvEntity.watchlist(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
  firstAirDate: 'firstAirDate',
);

final testTvSeriesTableModel = GomuflixTvWatchlistModel(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTvSeriesMap = {
  'id': 1,
  'name': 'name',
  'overview': 'overview',
  'posterPath': 'posterPath',
};
