import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GomuflixMoviePopularScreen extends StatefulWidget {
  static const ROUTE_NAME = '/popular-movie';

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
        Provider.of<GomuflixMovieListNotifier>(context, listen: false)
            .syncGomuMoviePopular());
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
        child: Consumer<GomuflixMovieListNotifier>(
          builder: (context, data, child) {
            if (data.state == RequestState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.state == RequestState.loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return GomuflixMovieContentCardWidget(
                      data.popularMovies[index]);
                },
                itemCount: data.popularMovies.length,
              );
            } else {
              return Center(
                key: const Key('error_message'),
                child: Text(
                  data.message,
                  style: subNameText,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
