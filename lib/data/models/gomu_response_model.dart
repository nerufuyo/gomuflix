import 'package:equatable/equatable.dart';
import 'package:gomuflix/data/models/gomu_movie_models.dart';

// Movie Response Model
class GomuflixMovieResponseModel extends Equatable {
  // Declarate Variable
  final List<GomuflixMovieModel> gomuMovieList;

  // Callback Variable
  const GomuflixMovieResponseModel({required this.gomuMovieList});

  // Get Value from API
  factory GomuflixMovieResponseModel.fromJson(Map<String, dynamic> json) =>
      GomuflixMovieResponseModel(
        gomuMovieList: List<GomuflixMovieModel>.from((json["results"] as List)
            .map((x) => GomuflixMovieModel.fromJson(x))
            .where((element) => element.posterPath != null)),
      );

  // Insert Value to Local Json
  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(gomuMovieList.map((x) => x.toJson())),
      };

  // Overriding Value
  @override
  List<Object> get props => [gomuMovieList];
}
