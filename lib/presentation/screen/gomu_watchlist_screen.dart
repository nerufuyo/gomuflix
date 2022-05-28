import 'package:flutter/material.dart';
import 'package:gomuflix/common/style.dart';

class GomuflixWatchlistScreen extends StatefulWidget {
  const GomuflixWatchlistScreen({Key? key}) : super(key: key);
  static const routeName = '/gomuflix-watchlist-scren';

  @override
  _GomuflixWatchlistScreenState createState() =>
      _GomuflixWatchlistScreenState();
}

class _GomuflixWatchlistScreenState extends State {
  @override
  void initState() {
    super.initState();
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
          'Watchlist',
          style: titleText,
        ),
      ),
      body: const Text('Test Data'),
    );
  }
}
