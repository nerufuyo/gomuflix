import 'package:flutter/material.dart';
import 'package:gomuflix/common/style.dart';
import 'package:gomuflix/presentation/screen/gomu_search_screen.dart';
import 'package:gomuflix/presentation/screen/gomu_tv_main_screen.dart';
import 'package:gomuflix/presentation/widgets/gomu_constant_widget.dart';
import 'package:gomuflix/presentation/widgets/gomu_drawer_widget.dart';

class GomuflixMovieMainScreen extends StatefulWidget {
  const GomuflixMovieMainScreen({Key? key}) : super(key: key);
  static const routeName = '/gomuflix-movies-main-screen';

  @override
  _GomuflixMovieMainScreenState createState() =>
      _GomuflixMovieMainScreenState();
}

class _GomuflixMovieMainScreenState extends State {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GomuflixDrawerWidget(
        onTapGomuflixMoviesScreen: () {
          Navigator.pop(context);
        },
        onTapGomuflixTvScreen: () {
          Navigator.pushNamed(context, GomuflixTvMainScreen.routeName);
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'GOMUFLIX',
          style: superTitleText,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, GomuflixSearchScreen.routeName);
              },
              icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const TitleGreyLine(),
                Text(
                  'MOVIES',
                  style: nameText,
                ),
                const TitleGreyLine()
              ],
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const TitleRedLine(),
                      const TitleDivider(),
                      Text(
                        'On Going',
                        style: subTitleText,
                      ),
                    ],
                  ),
                  const ContentDivider(),
                  const Text('Content Not Found!'),
                  const ContentDivider(),
                  Row(
                    children: [
                      const TitleRedLine(),
                      const TitleDivider(),
                      Text(
                        'Most Watched',
                        style: subTitleText,
                      ),
                    ],
                  ),
                  const ContentDivider(),
                  const Text('Content Not Found!'),
                  const ContentDivider(),
                  Row(
                    children: [
                      const TitleRedLine(),
                      const TitleDivider(),
                      Text(
                        'Top Rated',
                        style: subTitleText,
                      ),
                    ],
                  ),
                  const ContentDivider(),
                  const Text('Content Not Found!'),
                  const ContentDivider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
