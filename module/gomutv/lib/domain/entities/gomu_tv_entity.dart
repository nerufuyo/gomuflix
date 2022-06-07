// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

// Tv Entity
class GomuflixTvEntity extends Equatable {
  // Declarate Variable
  String? backdropPath;

  List<int>? genreIds;

  int id;

  String? originalName;

  String? overview;

  double? popularity;

  String? posterPath;

  String? firstAirDate;

  String? name;

  bool? video;

  double? voteAverage;

  int? voteCount;

  // Callback Variable
  GomuflixTvEntity(
      {required this.backdropPath,
      required this.genreIds,
      required this.id,
      required this.originalName,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.firstAirDate,
      required this.name,
      required this.voteAverage,
      required this.voteCount});

  // Callback Varable for Wacthlist
  GomuflixTvEntity.watchlist(
      {required this.id,
      required this.firstAirDate,
      required this.overview,
      required this.posterPath,
      required this.name});

  // Overriding
  @override
  List<Object?> get props => [
        backdropPath,
        genreIds,
        id,
        originalName,
        overview,
        popularity,
        posterPath,
        firstAirDate,
        name,
        video,
        voteAverage,
        voteCount
      ];
}

// Tv Detail Entity
class GomuflixTvDetailEntity extends Equatable {
  // Decalarate Variable
  String? backdropPath;

  List<GomuflixTvGenreEntity> genres;

  int id;

  String originalName;

  String overview;

  String posterPath;

  String firstAirDate;

  String name;

  int numberOfEpisodes;

  int numberOfSeasons;

  double voteAverage;

  int voteCount;

  // Callback Variable
  GomuflixTvDetailEntity(
      {required this.backdropPath,
      required this.genres,
      required this.id,
      required this.originalName,
      required this.overview,
      required this.posterPath,
      required this.firstAirDate,
      required this.name,
      required this.numberOfEpisodes,
      required this.numberOfSeasons,
      required this.voteAverage,
      required this.voteCount});

  // Overriding
  @override
  List<Object?> get props => [
        backdropPath,
        genres,
        id,
        originalName,
        overview,
        posterPath,
        firstAirDate,
        name,
        voteAverage,
        voteCount
      ];
}

// Tv Genre Entity
class GomuflixTvGenreEntity extends Equatable {
  // Declarate Variable
  int id;

  String name;

  // Callback Variable
  GomuflixTvGenreEntity({required this.id, required this.name});

  // Overriding
  @override
  List<Object> get props => [id, name];
}
