import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GomuflixTvTopRatedScreen extends StatefulWidget {
  static const routeName = '/top-rated-tv';

  const GomuflixTvTopRatedScreen({Key? key}) : super(key: key);

  @override
  _GomuflixTvTopRatedScreenState createState() =>
      _GomuflixTvTopRatedScreenState();
}

class _GomuflixTvTopRatedScreenState extends State<GomuflixTvTopRatedScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<GomuflixTvListNotifier>(context, listen: false)
            .syncGomuTvTopRated());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Top Rated',
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
                  return GomuflixTvContentCardWidget(data.topRatedTv[index]);
                },
                itemCount: data.topRatedTv.length,
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
