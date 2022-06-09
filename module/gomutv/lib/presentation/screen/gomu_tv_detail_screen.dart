import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      Provider.of<GomuflixTvDetailNotifier>(context, listen: false)
          .syncGomuTvDetail(widget.id);

      Provider.of<GomuflixTvDetailNotifier>(context, listen: false)
          .loadWatchlistStatus(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GomuflixTvDetailNotifier>(
        builder: (context, provider, child) {
          if (provider.tvState == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.tvState == RequestState.loaded) {
            return SafeArea(
              child: GomuflixTvDetailWidget(
                provider.tv,
                provider.tvRecommendations,
                provider.isAddedToWatchlist,
              ),
            );
          } else {
            return Text(provider.message);
          }
        },
      ),
    );
  }
}
