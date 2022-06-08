import 'package:flutter/material.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:gomutv/gomutv.dart';

class GomuflixDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.png'),
              ),
              accountName: Text('Listyo Adi Pamungkas'),
              accountEmail: Text('nerufuyo@gmail.com'),
              decoration: BoxDecoration(color: darkRedColor),
            ),
            ListTile(
              leading: const Icon(
                Icons.movie_creation_outlined,
                color: whiteColor,
              ),
              title: Text(
                'Movies',
                style: subNameText,
              ),
              onTap: () {
                Navigator.pushNamed(context, GomuflixMovieMainScreen.routeName);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.tv_outlined,
                color: whiteColor,
              ),
              title: Text(
                'Television',
                style: subNameText,
              ),
              onTap: () {
                Navigator.pushNamed(context, GomuflixTvMainScreen.routeName);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.save_alt_outlined,
                color: whiteColor,
              ),
              title: Text(
                'Watchlist',
                style: subNameText,
              ),
              onTap: () {
                Navigator.pushNamed(context, GomuflixWatchlistScreen.routeName);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.info_outline_rounded,
                color: whiteColor,
              ),
              title: Text(
                'About',
                style: subNameText,
              ),
              onTap: () {
                Navigator.pushNamed(context, GomuflixAboutScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
