import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomutv/gomutv.dart';
import 'package:flutter/material.dart';

class GomuflixTvDetailScreen extends StatefulWidget {
  static const routeName = '/detail-tv';

  final int id;

  const GomuflixTvDetailScreen({required this.id, Key? key}) : super(key: key);

  @override
  _GomuflixTvDetailScreenState createState() => _GomuflixTvDetailScreenState();
}

class _GomuflixTvDetailScreenState extends State<GomuflixTvDetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<GomuTvDetailBloc>().add(GomuTvDetailEvent(widget.id));

      context
          .read<GomuTvRecommendationBloc>()
          .add(GomuTvDetailEvent(widget.id));

      context
          .read<GomuTvWatchlistBloc>()
          .add(GomuTvWatchlistEventLoadWatchlistStatus(widget.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    GomuTvDetailState tvRecommendations =
        context.watch<GomuTvRecommendationBloc>().state;

    return Scaffold(
      body: BlocListener<GomuTvWatchlistBloc, GomuTvWatchlistState>(
        listener: (_, state) {
          if (state is GomuTvSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
            context
                .read<GomuTvWatchlistBloc>()
                .add(GomuTvWatchlistEventLoadWatchlistStatus(widget.id));
          }
        },
        child: BlocBuilder<GomuTvDetailBloc, GomuTvDetailState>(
          builder: (_, state) {
            if (state is GomuTvDetailLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is GomuTvDetailError) {
              return Center(
                child: Text(state.errorMessage),
              );
            }

            if (state is GomuTvDetailLoaded) {
              bool isAddedToWatchlistTv = (context
                      .watch<GomuTvWatchlistBloc>()
                      .state is GomuTvStatusLoaded)
                  ? (context.read<GomuTvWatchlistBloc>().state
                          as GomuTvStatusLoaded)
                      .isWatchlist
                  : false;

              return SafeArea(
                  child: GomuflixTvDetailWidget(
                state.gomuTvDetail,
                tvRecommendations is GomuTvRecommendationLoaded
                    ? tvRecommendations.gomuTvs
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
