import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        Provider.of<GomuTvPopularBloc>(context, listen: false)
            .add(GomuTvListEvent()));
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
        child: BlocBuilder<GomuTvPopularBloc, GomuTvListState>(
          builder: (context, state) {
            if (state is GomuTvListLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GomuTvListLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return GomuflixTvContentCardWidget(state.gomuTvs[index]);
                },
                itemCount: state.gomuTvs.length,
              );
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
      ),
    );
  }
}
