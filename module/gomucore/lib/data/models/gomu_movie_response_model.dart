import 'package:equatable/equatable.dart';
import 'package:gomucore/gomucore.dart';

class GomuflixMovieResponseModel extends Equatable {
  // Declare Variable
  final List<GomuflixMovieModel> gomuMovieList;

  // Callback Variable
  const GomuflixMovieResponseModel({required this.gomuMovieList});

  // Get Value From Json
  factory GomuflixMovieResponseModel.fromJson(Map<String, dynamic> json) =>
      GomuflixMovieResponseModel(
        gomuMovieList: List<GomuflixMovieModel>.from((json["results"] as List)
            .map((x) => GomuflixMovieModel.fromJson(x))
            .where((element) => element.posterPath != null)),
      );

  // Post Value to Json
  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(gomuMovieList.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [gomuMovieList];
}
