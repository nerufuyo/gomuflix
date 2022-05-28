import 'package:flutter/material.dart';
import 'package:gomuflix/common/style.dart';
import 'package:gomuflix/presentation/screen/gomu_movie_main_screen.dart';
import 'package:gomuflix/presentation/screen/gomu_search_screen.dart';
import 'package:gomuflix/presentation/widgets/gomu_constant_widget.dart';
import 'package:gomuflix/presentation/widgets/gomu_drawer_widget.dart';

class GomuflixTvMainScreen extends StatefulWidget {
  const GomuflixTvMainScreen({Key? key}) : super(key: key);
  static const routeName = '/gomuflix-tv-main-screen';

  @override
  _GomuflixTvMainScreenState createState() => _GomuflixTvMainScreenState();
}

class _GomuflixTvMainScreenState extends State {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GomuflixDrawerWidget(
        onTapGomuflixMoviesScreen: () {
          Navigator.pushNamed(context, GomuflixMovieMainScreen.routeName);
        },
        onTapGomuflixTvScreen: () {
          Navigator.pop(context);
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
                  'TELEVISION',
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
