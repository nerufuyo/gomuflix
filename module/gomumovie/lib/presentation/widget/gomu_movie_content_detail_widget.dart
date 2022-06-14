import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';

class GomuflixMovieDetailWidget extends StatelessWidget {
  final GomuflixMovieDetailEntity movie;
  final List<GomuflixMovieEntity> recommendations;
  final bool isAddedWatchlist;

  const GomuflixMovieDetailWidget(
      this.movie, this.recommendations, this.isAddedWatchlist,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: blackColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            Text(
                              movie.title,
                              style: titleText,
                            ),
                            // Watchlist Button
                            ElevatedButton(
                              onPressed: () async {
                                if (!isAddedWatchlist) {
                                  BlocProvider.of<GomuMovieWatchlistBloc>(
                                          context)
                                      .add(GomuMovieSaveEvent(movie));
                                } else {
                                  BlocProvider.of<GomuMovieWatchlistBloc>(
                                          context)
                                      .add(GomuMovieRemoveEvent(movie));
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  isAddedWatchlist
                                      ? const Icon(Icons.check)
                                      : const Icon(Icons.add),
                                  const Text('Watchlist'),
                                ],
                              ),
                            ),
                            Text(
                              _showGenres(movie.genres),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: movie.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${movie.voteAverage}')
                              ],
                            ),
                            ContentDivider(),
                            Text(
                              'Overview',
                              style: subTitleText,
                            ),
                            Text(
                              movie.overview,
                              style: subNameText,
                            ),
                            ContentDivider(),
                            Text(
                              'Recommendations',
                              style: subTitleText,
                            ),
                            BlocBuilder<GomuMovieRecommendationBloc,
                                GomuMovieDetailState>(
                              builder: (context, state) {
                                if (state is GomuMovieDetailLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state
                                    is GomuMovieRecommendationLoaded) {
                                  if (state.gomuMovieRecommendation.isEmpty) {
                                    return Center(
                                      child: Text(
                                        'No related recommendations',
                                        style: subNameText,
                                      ),
                                    );
                                  }
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: 140,
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                context,
                                                GomuflixMovieDetailScreen
                                                    .routeName,
                                                arguments:
                                                    recommendations[index].id,
                                              );
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                  child: CachedNetworkImage(
                                                    width: 150,
                                                    imageUrl:
                                                        'https://image.tmdb.org/t/p/w500${recommendations[index].posterPath}',
                                                    placeholder:
                                                        (context, url) =>
                                                            const Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    ),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        const Icon(Icons.error),
                                                  ),
                                                ),
                                                Text(
                                                  recommendations[index]
                                                      .title
                                                      .toString(),
                                                  style: nameText,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                                Text(
                                                  recommendations[index]
                                                      .releaseDate
                                                      .toString()
                                                      .substring(0, 4),
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: recommendations.length,
                                    ),
                                  );
                                }
                                if (state is GomuMovieDetailError) {
                                  return Center(
                                    key: const Key('error_message'),
                                    child: Text(state.errorMessage),
                                  );
                                } else {
                                  return const Center(
                                    child: Text('Default Return'),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            minChildSize: 0.25,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: lightRedColor,
              size: 30,
            ),
          ),
        )
      ],
    );
  }

  String _showGenres(List<GomuflixMovieGenreEntity> genres) {
    String result = '';

    for (var genre in genres) {
      result += genre.name + ', ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}
