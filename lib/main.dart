import 'package:flutter/material.dart';
import 'package:gomuflix/common/style.dart';
import 'package:gomuflix/presentation/screen/gomu_about_screen.dart';
import 'package:gomuflix/presentation/screen/gomu_movie_main_screen.dart';
import 'package:gomuflix/presentation/screen/gomu_search_screen.dart';
import 'package:gomuflix/presentation/screen/gomu_splash_screen.dart';
import 'package:gomuflix/presentation/screen/gomu_tv_main_screen.dart';
import 'package:gomuflix/presentation/screen/gomu_watchlist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GOMUFLIX',
      theme: ThemeData.dark().copyWith(
        colorScheme: themeColor,
        primaryColor: blackColor,
        scaffoldBackgroundColor: blackColor,
      ),
      home: const GomuflixSplashScreen(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case GomuflixSplashScreen.routeName:
            return MaterialPageRoute(
                builder: (_) => const GomuflixSplashScreen());

          // Movie Screen
          case GomuflixMovieMainScreen.routeName:
            return MaterialPageRoute(
                builder: (_) => const GomuflixMovieMainScreen());

          // Tv Screen
          case GomuflixTvMainScreen.routeName:
            return MaterialPageRoute(
                builder: (_) => const GomuflixTvMainScreen());

          // Other
          case GomuflixSearchScreen.routeName:
            return MaterialPageRoute(
                builder: (_) => const GomuflixSearchScreen());
          case GomuflixWatchlistScreen.routeName:
            return MaterialPageRoute(
                builder: (_) => const GomuflixWatchlistScreen());
          case GomuflixAboutScreen.routeName:
            return MaterialPageRoute(
                builder: (_) => const GomuflixAboutScreen());
          default:
            return MaterialPageRoute(
              builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Sorry, We can\t find any page.'),
                  ),
                );
              },
            );
        }
      },
    );
  }
}
