import 'package:gomumovie/gomumovie.dart';
import 'package:equatable/equatable.dart';

// Movie Model
class GomuflixMovieModel extends Equatable {
  // Declare Variable
  final bool adult;

  final String? backdropPath;

  final List<int> genreIds;

  final int id;

  final String originalTitle;

  final String overview;

  final double popularity;

  final String? posterPath;

  final String? releaseDate;

  final String title;

  final bool video;

  final double voteAverage;

  final int voteCount;

  // Callback Variable
  const GomuflixMovieModel(
      {required this.adult,
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
      required this.voteCount});

  // Get Value from API to Json
  factory GomuflixMovieModel.fromJson(Map<String, dynamic> json) =>
      GomuflixMovieModel(
          adult: json["adult"],
          backdropPath: json["backdrop_path"],
          genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
          id: json["id"],
          originalTitle: json["original_title"],
          overview: json["overview"],
          popularity: json["popularity"].toDouble(),
          posterPath: json["poster_path"],
          releaseDate: json["release_date"],
          title: json["title"],
          video: json["video"],
          voteAverage: json["vote_average"].toDouble(),
          voteCount: json["vote_count"]);

  // Get Value from Json to Variable
  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount
      };

  // Get Value Variable to Entity
  GomuflixMovieEntity toEntity() {
    return GomuflixMovieEntity(
        adult: adult,
        backdropPath: backdropPath,
        genreIds: genreIds,
        id: id,
        originalTitle: originalTitle,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        releaseDate: releaseDate,
        title: title,
        video: video,
        voteAverage: voteAverage,
        voteCount: voteCount);
  }

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
        voteCount
      ];
}

// Movie Detail Model
class GomuflixMovieDetailModel extends Equatable {
  // Declare Variable
  final bool adult;

  final String? backdropPath;

  final int budget;

  final List<GomuflixMovieGenreModel> genres;

  final String homepage;

  final int id;

  final String? imdbId;

  final String originalLanguage;

  final String originalTitle;

  final String overview;

  final double popularity;

  final String posterPath;

  final String releaseDate;

  final int revenue;

  final int runtime;

  final String status;

  final String tagline;

  final String title;

  final bool video;

  final double voteAverage;

  final int voteCount;

  // Callback Variable
  const GomuflixMovieDetailModel(
      {required this.adult,
      required this.backdropPath,
      required this.budget,
      required this.genres,
      required this.homepage,
      required this.id,
      required this.imdbId,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.revenue,
      required this.runtime,
      required this.status,
      required this.tagline,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount});

  // Get Value Api to Variable
  factory GomuflixMovieDetailModel.fromJson(Map<String, dynamic> json) =>
      GomuflixMovieDetailModel(
          adult: json["adult"],
          backdropPath: json["backdrop_path"],
          budget: json["budget"],
          genres: List<GomuflixMovieGenreModel>.from(
              json["genres"].map((x) => GomuflixMovieGenreModel.fromJson(x))),
          homepage: json["homepage"],
          id: json["id"],
          imdbId: json["imdb_id"],
          originalLanguage: json["original_language"],
          originalTitle: json["original_title"],
          overview: json["overview"],
          popularity: json["popularity"].toDouble(),
          posterPath: json["poster_path"],
          releaseDate: json["release_date"],
          revenue: json["revenue"],
          runtime: json["runtime"],
          status: json["status"],
          tagline: json["tagline"],
          title: json["title"],
          video: json["video"],
          voteAverage: json["vote_average"].toDouble(),
          voteCount: json["vote_count"]);

  // Get Value Variable to Json
  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "budget": budget,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "revenue": revenue,
        "runtime": runtime,
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount
      };

  // Get Value Json to Entity
  GomuflixMovieDetailEntity toEntity() {
    return GomuflixMovieDetailEntity(
        adult: adult,
        backdropPath: backdropPath,
        genres: genres.map((genre) => genre.toEntity()).toList(),
        id: id,
        originalTitle: originalTitle,
        overview: overview,
        posterPath: posterPath,
        releaseDate: releaseDate,
        runtime: runtime,
        title: title,
        voteAverage: voteAverage,
        voteCount: voteCount);
  }

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        budget,
        genres,
        homepage,
        id,
        imdbId,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        revenue,
        runtime,
        status,
        tagline,
        title,
        video,
        voteAverage,
        voteCount
      ];
}

// Movie Watchlist Model
class GomuflixMovieWatchlistModel extends Equatable {
  // Declare Variable
  final int id;

  final String? title;

  final String? posterPath;

  final String? overview;

  // Callback Variable
  const GomuflixMovieWatchlistModel(
      {required this.id,
      required this.title,
      required this.posterPath,
      required this.overview});

  // Get Entity to Model
  factory GomuflixMovieWatchlistModel.fromEntity(
          GomuflixMovieDetailEntity movie) =>
      GomuflixMovieWatchlistModel(
          id: movie.id,
          title: movie.title,
          posterPath: movie.posterPath,
          overview: movie.overview);

  // Get Value Api to Variable
  factory GomuflixMovieWatchlistModel.fromMap(Map<String, dynamic> map) =>
      GomuflixMovieWatchlistModel(
          id: map['id'],
          title: map['title'],
          posterPath: map['posterPath'],
          overview: map['overview']);

  // Get Value Variable to Local Json
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'posterPath': posterPath,
        'overview': overview
      };

  // Post Value Json to Entity
  GomuflixMovieEntity toEntity() => GomuflixMovieEntity.watchlist(
      id: id, overview: overview, posterPath: posterPath, title: title);

  @override
  List<Object?> get props => [id, title, posterPath, overview];
}

class GomuflixMovieGenreModel extends Equatable {
  // Declarate Variable
  final int id;

  final String name;

  // Callback Variable
  const GomuflixMovieGenreModel({
    required this.id,
    required this.name,
  });

  // Convert Api to Local Variable
  factory GomuflixMovieGenreModel.fromJson(Map<String, dynamic> json) =>
      GomuflixMovieGenreModel(id: json["id"], name: json["name"]);

  // Local Json to Entity
  Map<String, dynamic> toJson() => {"id": id, "name": name};

  GomuflixMovieGenreEntity toEntity() {
    return GomuflixMovieGenreEntity(id: id, name: name);
  }

  @override
  List<Object?> get props => [id, name];
}
