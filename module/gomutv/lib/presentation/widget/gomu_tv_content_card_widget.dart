import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';

class GomuflixTvContentCardWidget extends StatelessWidget {
  // Declarate Variable
  final GomuflixTvEntity gomuTv;

  // Callback Variable
  const GomuflixTvContentCardWidget(this.gomuTv, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: darkRedColor,
        highlightColor: bloodRedColor,
        onTap: () {
          Navigator.pushNamed(context, GomuflixTvDetailScreen.routeName,
              arguments: gomuTv.id);
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: '$baseImageUrl${gomuTv.posterPath}',
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
                      gomuTv.originalName.toString(),
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
                          rating: gomuTv.voteAverage! / 2,
                        ),
                        Text(
                          '${gomuTv.voteAverage}',
                          style: subNameText,
                        )
                      ],
                    ),
                    Text(
                      gomuTv.overview.toString(),
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
