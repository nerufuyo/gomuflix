import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    Future.microtask(() => Provider.of<GomuTvOnAirBloc>(context, listen: false)
        .add(GomuTvListEvent()));
    Future.microtask(() =>
        Provider.of<GomuTvPopularBloc>(context, listen: false)
            .add(GomuTvListEvent()));
    Future.microtask(() =>
        Provider.of<GomuTvTopRatedBloc>(context, listen: false)
            .add(GomuTvListEvent()));
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
                  BlocBuilder<GomuTvOnAirBloc, GomuTvListState>(
                    builder: (context, state) {
                      if (state is GomuTvListLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is GomuTvListLoaded) {
                        return GomuflixTvList(state.gomuTvs);
                      } else if (state is GomuTvListError) {
                        return Center(
                          key: const Key('error_message'),
                          child: Text(state.errorMessage),
                        );
                      } else {
                        return Container();
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
                  BlocBuilder<GomuTvPopularBloc, GomuTvListState>(
                    builder: (context, state) {
                      if (state is GomuTvListLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is GomuTvListLoaded) {
                        return GomuflixTvList(state.gomuTvs);
                      } else if (state is GomuTvListError) {
                        return Center(
                          key: const Key('error_message'),
                          child: Text(state.errorMessage),
                        );
                      } else {
                        return Container();
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
                  BlocBuilder<GomuTvTopRatedBloc, GomuTvListState>(
                    builder: (context, state) {
                      if (state is GomuTvListLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is GomuTvListLoaded) {
                        return GomuflixTvList(state.gomuTvs);
                      } else if (state is GomuTvListError) {
                        return Center(
                          key: const Key('error_message'),
                          child: Text(state.errorMessage),
                        );
                      } else {
                        return Container();
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
