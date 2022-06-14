import 'package:cached_network_image/cached_network_image.dart';
import 'package:gomucore/gomucore.dart';
import 'package:flutter/material.dart';
import 'package:gomumovie/gomumovie.dart';

class GomuflixMovieList extends StatelessWidget {
  // Declare Varaible
  final List<GomuflixMovieEntity> gomuMovie;

  // Callback Variable
  const GomuflixMovieList(this.gomuMovie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 140,
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                    context, GomuflixMovieDetailScreen.routeName,
                    arguments: gomuMovie[index].id);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: CachedNetworkImage(
                      width: 150,
                      imageUrl: '$baseImageUrl${gomuMovie[index].posterPath}',
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Text(
                    gomuMovie[index].title.toString(),
                    style: nameText,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    gomuMovie[index].releaseDate.toString().substring(0, 4),
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          );
        },
        itemCount: gomuMovie.length,
      ),
    );
  }
}
