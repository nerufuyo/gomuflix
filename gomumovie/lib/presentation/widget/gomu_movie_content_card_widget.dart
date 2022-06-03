import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';

class GomuflixMovieContentCardWidget extends StatelessWidget {
  // Declarate Variable
  final GomuflixMovieEntity gomuMovie;

  // Callback Variable
  const GomuflixMovieContentCardWidget(this.gomuMovie, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: darkRedColor,
        highlightColor: bloodRedColor,
        onTap: () {},
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: '$baseImageUrl${gomuMovie.posterPath}',
                height: 150,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      gomuMovie.title.toString(),
                      style: subTitleText,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        RatingBarIndicator(
                          itemCount: 5,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          itemSize: 20,
                          rating: gomuMovie.voteAverage! / 2,
                        ),
                        Text(
                          '${gomuMovie.voteAverage}',
                          style: subNameText,
                        )
                      ],
                    ),
                    Text(
                      gomuMovie.overview.toString(),
                      style: subNameText,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
