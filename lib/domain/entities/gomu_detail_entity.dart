import 'package:equatable/equatable.dart';

class GomuflixMovieDetailEntity extends Equatable {
  // Get Variable from API
  final bool adult;
  final String? backdropPath;
  final List<GomuflixGenreEntity> genres;
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

  // Override API to Local Array
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

class GomuflixGenreEntity extends Equatable {
  final int id;
  final String name;

  const GomuflixGenreEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
