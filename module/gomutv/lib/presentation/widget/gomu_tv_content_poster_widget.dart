import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomutv/gomutv.dart';

class GomuflixTvList extends StatelessWidget {
  // Declare Varaible
  final List<GomuflixTvEntity> gomuTv;

  // Callback Variable
  const GomuflixTvList(this.gomuTv, {Key? key}) : super(key: key);

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
                Navigator.pushNamed(context, GomuflixTvDetailScreen.routeName,
                    arguments: gomuTv[index].id);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: CachedNetworkImage(
                      width: 150,
                      imageUrl: '$baseImageUrl${gomuTv[index].posterPath}',
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Text(
                    gomuTv[index].name.toString(),
                    style: nameText,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    gomuTv[index].firstAirDate.toString().substring(0, 4),
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          );
        },
        itemCount: gomuTv.length,
      ),
    );
  }
}
