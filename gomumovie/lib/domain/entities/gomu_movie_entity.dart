// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

// Movie Entity
class GomuflixMovieEntity extends Equatable {
  // Declare Variable
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int id;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  // Callback Variable
  GomuflixMovieEntity({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  // Callback Watchlist Variable
  GomuflixMovieEntity.watchlist({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.title,
  });

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}

// Movie Detail Entity
class GomuflixMovieDetailEntity extends Equatable {
  // Declare Variable
  final bool adult;
  final String? backdropPath;
  final List<GomuflixMovieGenreEntity> genres;
  final int id;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAverage;
  final int voteCount;

  // Callback Variable
  const GomuflixMovieDetailEntity({
    required this.adult,
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genres,
        id,
        originalTitle,
        overview,
        posterPath,
        releaseDate,
        title,
        voteAverage,
        voteCount,
      ];
}

// Movie Genre Entity
class GomuflixMovieGenreEntity extends Equatable {
  // Declare Variable
  final int id;
  final String name;

  // Callback Variable
  const GomuflixMovieGenreEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
