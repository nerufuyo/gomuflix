import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/data/models/gomu_movie_model.dart';
import 'package:gomucore/data/models/gomu_tv_model.dart';
import 'package:gomumovie/domain/entities/gomu_movie_entity.dart';
import 'package:gomutv/domain/entities/gomu_tv_entity.dart';

void main() {
  // Tv
  final testTvModel = GomuflixTvModel(
    backdropPath: 'backdropPath',
    genreIds: [1, 2],
    id: 1,
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1.0,
    posterPath: 'posterPath',
    firstAirDate: 'firstAirDate',
    name: 'name',
    voteAverage: 1.0,
    voteCount: 1,
  );

  final testTv = GomuflixTvEntity(
    backdropPath: 'backdropPath',
    genreIds: [1, 2],
    id: 1,
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1.0,
    posterPath: 'posterPath',
    firstAirDate: 'firstAirDate',
    name: 'name',
    voteAverage: 1.0,
    voteCount: 1,
  );

  // Movie
  final tMovieModel = GomuflixMovieModel(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );

  final testMovie = GomuflixMovieEntity(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );

  test('should be a subclass of Movie and Tv entity', () async {
    final tvResult = testTvModel.toEntity();

    final movieResult = tMovieModel.toEntity();

    expect(tvResult, testTv);

    expect(movieResult, testMovie);
  });
}
