import 'package:flutter/material.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';
import 'package:provider/provider.dart';

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
    Future.microtask(
        () => Provider.of<GomuflixTvListNotifier>(context, listen: false)
          ..syncGomuTvOnAir()
          ..syncGomuTvPopular()
          ..syncGomuTvTopRated());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GomuflixDrawerWidget(),
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
        child: SingleChildScrollView(
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
              Column(
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
                  Consumer<GomuflixTvListNotifier>(
                    builder: (context, data, child) {
                      if (data.gomuTvOnAirState == RequestState.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (data.gomuTvOnAirState == RequestState.loaded) {
                        return GomuflixTvList(data.onAirTv);
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
                  const ContentDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const TitleRedLine(),
                          const TitleDivider(),
                          Text(
                            'Popular',
                            style: subTitleText,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, GomuflixTvPopularScreen.routeName);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: lightRedColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              'See all',
                              style: subNameText,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const ContentDivider(),
                  Consumer<GomuflixTvListNotifier>(
                    builder: (context, data, child) {
                      if (data.gomuTvPopularState == RequestState.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (data.gomuTvPopularState ==
                          RequestState.loaded) {
                        return GomuflixTvList(data.popularTv);
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
                  const ContentDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, GomuflixTvTopRatedScreen.routeName);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: lightRedColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              'See all',
                              style: subNameText,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const ContentDivider(),
                  Consumer<GomuflixTvListNotifier>(
                    builder: (context, data, child) {
                      if (data.gomuTvTopRatedState == RequestState.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (data.gomuTvTopRatedState ==
                          RequestState.loaded) {
                        return GomuflixTvList(data.topRatedTv);
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
                  const ContentDivider(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
