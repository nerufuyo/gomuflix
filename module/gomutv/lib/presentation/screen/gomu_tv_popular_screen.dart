import 'package:flutter/material.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';
import 'package:provider/provider.dart';

class GomuflixTvPopularScreen extends StatefulWidget {
  static const routeName = '/popular-tv';

  const GomuflixTvPopularScreen({Key? key}) : super(key: key);

  @override
  _GomuflixTvPopularScreenState createState() =>
      _GomuflixTvPopularScreenState();
}

class _GomuflixTvPopularScreenState extends State {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<GomuflixTvListNotifier>(context, listen: false)
            .syncGomuTvPopular());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Popular',
          style: titleText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<GomuflixTvListNotifier>(
          builder: (context, data, child) {
            if (data.state == RequestState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.state == RequestState.loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return GomuflixTvContentCardWidget(data.popularTv[index]);
                },
                itemCount: data.popularTv.length,
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