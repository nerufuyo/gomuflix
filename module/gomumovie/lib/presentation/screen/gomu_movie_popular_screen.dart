import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GomuflixMoviePopularScreen extends StatefulWidget {
  static const routeName = '/popular-movie';

  const GomuflixMoviePopularScreen({Key? key}) : super(key: key);

  @override
  _GomuflixMoviePopularScreenState createState() =>
      _GomuflixMoviePopularScreenState();
}

class _GomuflixMoviePopularScreenState
    extends State<GomuflixMoviePopularScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<GomuMoviePopularBloc>(context, listen: false)
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
          'Popular',
          style: titleText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<GomuMoviePopularBloc, GomuMovieListState>(
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
