import 'package:flutter/material.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:provider/provider.dart';

class GomuflixSearchScreen extends StatelessWidget {
  GomuflixSearchScreen({Key? key}) : super(key: key);
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
                Provider.of<GomuflixTvSearchNotifier>(context, listen: false)
                    .syncSearchTv(query);
                Provider.of<GomuflixMovieSearchNotifier>(context, listen: false)
                    .syncSearchMovie(query);
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
                      'Result: ',
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
            Consumer<GomuflixTvSearchNotifier>(
              builder: (context, data, child) {
                if (data.stateVar == RequestState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (data.stateVar == RequestState.loaded) {
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        return GomuflixTvContentCardWidget(
                            data.searchResult[index]);
                      },
                      itemCount: data.searchResult.length,
                    ),
                  );
                } else {
                  return Expanded(
                    child: Container(),
                  );
                }
              },
            ),
            Consumer<GomuflixMovieSearchNotifier>(
              builder: (context, data, child) {
                if (data.state == RequestState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (data.state == RequestState.loaded) {
                  final result = data.searchResult;
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        return GomuflixMovieContentCardWidget(
                            data.searchResult[index]);
                      },
                      itemCount: result.length,
                    ),
                  );
                } else {
                  return Expanded(
                    child: Container(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
