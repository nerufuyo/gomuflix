import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:gomucore/data/models/gomu_movie_model.dart';
import 'package:gomucore/data/models/gomu_movie_response_model.dart';
import 'package:gomucore/data/models/gomu_tv_model.dart';
import 'package:gomucore/data/models/gomu_tv_response_model.dart';

import '../../gomu_reader_json.dart';

void main() {
  // Tv
  final testTvModel = GomuflixTvModel(
    backdropPath: '/path.jpg',
    genreIds: [1, 2],
    id: 1,
    originalName: 'Original Name',
    overview: 'Overview',
    popularity: 1,
    posterPath: '/path.jpg',
    firstAirDate: '2020-05-05',
    name: 'Name',
    voteAverage: 1.0,
    voteCount: 1,
  );

  // Movie
  final testMovieModel = GomuflixMovieModel(
    adult: false,
    backdropPath: "/path.jpg",
    genreIds: [1, 2, 3, 4],
    id: 1,
    originalTitle: "Original Title",
    overview: "Overview",
    popularity: 1.0,
    posterPath: "/path.jpg",
    releaseDate: "2020-05-05",
    title: "Title",
    video: false,
    voteAverage: 1.0,
    voteCount: 1,
  );

  // Tv Test
  final testTvResponseModelModel =
      GomuflixTvResponseModel(gomuTvList: <GomuflixTvModel>[testTvModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/gomu_tv_on_air.json'));

      // act
      final result = GomuflixTvResponseModel.fromJson(jsonMap);

      // assert
      expect(result, testTvResponseModelModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // act
      final result = testTvResponseModelModel.toJson();

      // assert
      final expectedJsonMap = {
        "results": [
          {
            "backdrop_path": "/path.jpg",
            "genre_ids": [1, 2],
            "id": 1,
            "original_name": "Original Name",
            "overview": "Overview",
            "popularity": 1.0,
            "poster_path": "/path.jpg",
            "release_date": "2020-05-05",
            "name": "Name",
            "vote_average": 1.0,
            "vote_count": 1
          }
        ],
      };

      expect(result, expectedJsonMap);
    });
  });

  // Movie Test
  final testMovieResponseModel = GomuflixMovieResponseModel(
      gomuMovieList: <GomuflixMovieModel>[testMovieModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/gomu_movie_now_playing.json'));

      // act
      final result = GomuflixMovieResponseModel.fromJson(jsonMap);

      // assert
      expect(result, testMovieResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // act
      final result = testMovieResponseModel.toJson();

      // assert
      final expectedJsonMap = {
        "results": [
          {
            "adult": false,
            "backdrop_path": "/path.jpg",
            "genre_ids": [1, 2, 3, 4],
            "id": 1,
            "original_title": "Original Title",
            "overview": "Overview",
            "popularity": 1.0,
            "poster_path": "/path.jpg",
            "release_date": "2020-05-05",
            "title": "Title",
            "video": false,
            "vote_average": 1.0,
            "vote_count": 1
          }
        ],
      };

      expect(result, expectedJsonMap);
    });
  });
}
