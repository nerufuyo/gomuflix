import 'package:equatable/equatable.dart';
import 'package:gomucore/gomucore.dart';

class GomuflixTvResponseModel extends Equatable {
  // Declarate Variable
  final List<GomuflixTvModel> gomuTvList;

  // Callback Variable
  const GomuflixTvResponseModel({required this.gomuTvList});

  // Convert Api to Local Variable
  factory GomuflixTvResponseModel.fromJson(Map<String, dynamic> json) =>
      GomuflixTvResponseModel(
        gomuTvList: List<GomuflixTvModel>.from((json["results"] as List)
            .map((x) => GomuflixTvModel.fromJson(x))
            .where((element) => element.posterPath != null)),
      );

  // Local Variable to Local Json
  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(gomuTvList.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [gomuTvList];
}
