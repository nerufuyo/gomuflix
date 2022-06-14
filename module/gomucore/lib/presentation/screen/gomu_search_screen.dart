import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:gomutv/gomutv.dart';

class GomuflixSearchScreen extends StatelessWidget {
  static const routeName = '/gomuflix-search-screen';

  final textController = TextEditingController();

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
          'Search',
          style: titleText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                hintText: 'Search movies and tv',
                prefixIcon: Icon(Icons.search_rounded),
              ),
              onChanged: (query) {
                context.read<GomuTvSearchBloc>().add(
                      GomuTvSearchEventSearch(query),
                    );
                context.read<GomuMovieSearchBloc>().add(
                      GomuMovieSearchEventSearch(query),
                    );
              },
            ),
            const ContentDivider(),
            Column(
              children: [
                Row(
                  children: [
                    const TitleRedLine(),
                    const TitleDivider(),
                    Text(
                      'Tv Result: ',
                      style: subTitleText,
                    ),
                    Text(
                      textController.text,
                      style: subTitleText,
                    )
                  ],
                ),
              ],
            ),
            const ContentDivider(),
            BlocBuilder<GomuTvSearchBloc, GomuTvSearchState>(
              builder: (context, state) {
                if (state is GomuTvSearchLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GomuTvSearchLoaded) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.36,
                    child: Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemBuilder: (context, index) {
                          return GomuflixTvContentCardWidget(
                              state.results[index]);
                        },
                        itemCount: state.results.length,
                      ),
                    ),
                  );
                } else if (state is GomuTvSearchInitial) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is GomuTvSearchError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else {
                  return Container();
                }
              },
            ),
            Column(
              children: [
                Row(
                  children: [
                    const TitleRedLine(),
                    const TitleDivider(),
                    Text(
                      'Movie Result: ',
                      style: subTitleText,
                    ),
                    Text(
                      textController.text,
                      style: subTitleText,
                    )
                  ],
                ),
              ],
            ),
            BlocBuilder<GomuMovieSearchBloc, GomuMovieSearchState>(
              builder: (context, state) {
                if (state is GomuMovieSearchLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GomuMovieSearchLoaded) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.36,
                    child: Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemBuilder: (context, index) {
                          return GomuflixMovieContentCardWidget(
                              state.results[index]);
                        },
                        itemCount: state.results.length,
                      ),
                    ),
                  );
                } else if (state is GomuMovieSearchInitial) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is GomuMovieSearchError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else {
                  return Container();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
