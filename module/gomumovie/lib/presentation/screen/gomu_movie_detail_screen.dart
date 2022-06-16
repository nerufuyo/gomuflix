import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:gomumovie/gomumovie.dart';

class GomuflixMovieDetailScreen extends StatefulWidget {
  static const routeName = '/detail-movie';

  final int id;
  const GomuflixMovieDetailScreen({required this.id, Key? key})
      : super(key: key);

  @override
  _GomuflixMovieDetailScreenState createState() =>
      _GomuflixMovieDetailScreenState();
}

class _GomuflixMovieDetailScreenState extends State<GomuflixMovieDetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<GomuMovieDetailBloc>().add(GomuMovieDetailEvent(widget.id));

      context
          .read<GomuMovieRecommendationBloc>()
          .add(GomuMovieDetailEvent(widget.id));

      context
          .read<GomuMovieWatchlistBloc>()
          .add(GomuMovieGetStatusEvent(widget.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<GomuMovieWatchlistBloc, GomuMovieWatchlistState>(
        listener: (_, state) {
          if (state is GomuMovieSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
            context
                .read<GomuMovieWatchlistBloc>()
                .add(GomuMovieGetStatusEvent(widget.id));
          }
        },
        child: BlocBuilder<GomuMovieDetailBloc, GomuMovieDetailState>(
          builder: (_, state) {
            if (state is GomuMovieDetailLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is GomuMovieDetailError) {
              return Center(
                child: Text(state.errorMessage),
              );
            }

            if (state is GomuMovieDetailLoaded) {
              GomuMovieDetailState movieRecommendations =
                  context.watch<GomuMovieRecommendationBloc>().state;

              bool isAddedToWatchlistTv = (context
                      .watch<GomuMovieWatchlistBloc>()
                      .state is GomuMovieStatusLoaded)
                  ? (context.read<GomuMovieWatchlistBloc>().state
                          as GomuMovieStatusLoaded)
                      .isWatchlist
                  : false;

              return SafeArea(
                  child: GomuflixMovieDetailWidget(
                state.gomuMovieDetail,
                movieRecommendations is GomuMovieRecommendationLoaded
                    ? movieRecommendations.gomuMovieRecommendation
                    : List.empty(),
                isAddedToWatchlistTv,
              ));
            }

            return Container();
          },
        ),
      ),
    );
  }
}
