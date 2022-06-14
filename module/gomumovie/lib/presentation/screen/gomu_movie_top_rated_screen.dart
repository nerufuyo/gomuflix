import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GomuflixMovieTopRatedScreen extends StatefulWidget {
  static const routeName = '/top-rated-movie';

  const GomuflixMovieTopRatedScreen({Key? key}) : super(key: key);

  @override
  _GomuflixMovieTopRatedScreenState createState() =>
      _GomuflixMovieTopRatedScreenState();
}

class _GomuflixMovieTopRatedScreenState
    extends State<GomuflixMovieTopRatedScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<GomuMovieTopRatedBloc>(context, listen: false)
            .add(GomuMovieListEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: lightRedColor,
            size: 30,
          ),
        ),
        title: Text(
          'Top Rated',
          style: titleText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<GomuMovieTopRatedBloc, GomuMovieListState>(
          builder: (context, state) {
            if (state is GomuMovieListLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GomuMovieListLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return GomuflixMovieContentCardWidget(
                      state.gomuMovies[index]);
                },
                itemCount: state.gomuMovies.length,
              );
            } else if (state is GomuMovieListError) {
              return Center(
                key: const Key('error_message'),
                child: Text(state.errorMessage),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
