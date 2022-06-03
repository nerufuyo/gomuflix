import 'package:equatable/equatable.dart';
import 'package:gomutv/gomutv.dart';

// Tv Model
class GomuflixTvModel extends Equatable {
  // Declarate Variable
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalName;
  final String overview;
  final double popularity;
  final String? posterPath;
  final String? firstAirDate;
  final String name;
  final double voteAverage;
  final int voteCount;

  // Callback Variable
  const GomuflixTvModel({
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  // Convert Api to Local Variable
  factory GomuflixTvModel.fromJson(Map<String, dynamic> json) =>
      GomuflixTvModel(
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        firstAirDate: json["first_air_date"],
        name: json["name"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  // Local Variable to Local Json
  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": firstAirDate,
        "name": name,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  // Local Json to Entity
  GomuflixTvEntity toEntity() {
    return GomuflixTvEntity(
      backdropPath: backdropPath,
      genreIds: genreIds,
      id: id,
      originalName: originalName,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      firstAirDate: firstAirDate,
      name: name,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

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
        voteAverage,
        voteCount,
      ];
}

// Tv Detail
class GomuflixTvDetailModel extends Equatable {
  // Declarate Variable
  final String? backdropPath;
  final List<GomuflixTvGenreModel> genres;
  final String homepage;
  final int id;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final String firstAirDate;
  final String status;
  final String tagline;
  final String name;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final double voteAverage;
  final int voteCount;

  // Callback Variable
  const GomuflixTvDetailModel({
    required this.backdropPath,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.status,
    required this.tagline,
    required this.name,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.voteAverage,
    required this.voteCount,
  });

  // Convert Api to Local Variable
  factory GomuflixTvDetailModel.fromJson(Map<String, dynamic> json) =>
      GomuflixTvDetailModel(
        backdropPath: json["backdrop_path"],
        genres: List<GomuflixTvGenreModel>.from(
            json["genres"].map((x) => GomuflixTvGenreModel.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        firstAirDate: json["first_air_date"],
        status: json["status"],
        tagline: json["tagline"],
        name: json["name"],
        numberOfEpisodes: json["number_of_episodes"],
        numberOfSeasons: json["number_of_seasons"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  // Local Variable to Local Json
  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "first_air_date": firstAirDate,
        "status": status,
        "tagline": tagline,
        "name": name,
        "number_of_episodes": numberOfEpisodes,
        "number_of_seasons": numberOfSeasons,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  // Local Json to Entity
  GomuflixTvDetailEntity toEntity() {
    return GomuflixTvDetailEntity(
      backdropPath: backdropPath,
      genres: genres.map((genre) => genre.toEntity()).toList(),
      id: id,
      originalName: originalName,
      overview: overview,
      posterPath: posterPath,
      firstAirDate: firstAirDate,
      name: name,
      numberOfEpisodes: numberOfEpisodes,
      numberOfSeasons: numberOfSeasons,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  @override
  List<Object?> get props => [
        backdropPath,
        genres,
        homepage,
        id,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        firstAirDate,
        status,
        tagline,
        name,
        voteAverage,
        voteCount,
      ];
}

// Tv Genre
class GomuflixTvGenreModel extends Equatable {
  // Declarate Variable
  final int id;
  final String name;

  // Callback Variable
  const GomuflixTvGenreModel({
    required this.id,
    required this.name,
  });

  // Convert Api to Local Varable
  factory GomuflixTvGenreModel.fromJson(Map<String, dynamic> json) =>
      GomuflixTvGenreModel(
        id: json["id"],
        name: json["name"],
      );

  // Local Variable to Local Json
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  // Local Json to Entity
  GomuflixTvGenreEntity toEntity() {
    return GomuflixTvGenreEntity(id: id, name: name);
  }

  @override
  List<Object?> get props => [id, name];
}

// Tv Watchlist
class GomuflixTvWatchlistModel extends Equatable {
  // Declarate Variable
  final int id;
  final String? name;
  final String? posterPath;
  final String? overview;

  // Callback Variable
  const GomuflixTvWatchlistModel({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.overview,
  });

  // Convert Api to Local Variable
  factory GomuflixTvWatchlistModel.fromEntity(GomuflixTvDetailEntity tv) =>
      GomuflixTvWatchlistModel(
        id: tv.id,
        name: tv.name,
        posterPath: tv.posterPath,
        overview: tv.overview,
      );

  factory GomuflixTvWatchlistModel.fromMap(Map<String, dynamic> map) =>
      GomuflixTvWatchlistModel(
        id: map['id'],
        name: map['name'],
        posterPath: map['posterPath'],
        overview: map['overview'],
      );

  // Local Variable to local Json
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'posterPath': posterPath,
        'overview': overview,
      };

  // Local Json to Entity
  GomuflixTvEntity toEntity() => GomuflixTvEntity.watchlist(
      id: id,
      overview: overview,
      posterPath: posterPath,
      name: name,
      firstAirDate: null);

  @override
  List<Object?> get props => [id, name, posterPath, overview];
}
