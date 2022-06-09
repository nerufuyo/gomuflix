import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gomucore/gomucore.dart';
import 'package:gomumovie/gomumovie.dart';
import 'package:gomutv/gomutv.dart';
import 'package:provider/provider.dart';
import 'package:gomuflix/injection.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Movie Provider
        ChangeNotifierProvider(
            create: (_) => di.locator<GomuflixMovieListNotifier>()),
        ChangeNotifierProvider(
            create: (_) => di.locator<GomuflixMovieDetailNotifier>()),
        ChangeNotifierProvider(
            create: (_) => di.locator<GomuflixMovieSearchNotifier>()),

        // Tv Provider
        ChangeNotifierProvider(
            create: (_) => di.locator<GomuflixTvListNotifier>()),
        ChangeNotifierProvider(
            create: (_) => di.locator<GomuflixTvDetailNotifier>()),
        ChangeNotifierProvider(
            create: (_) => di.locator<GomuflixTvSearchNotifier>()),
      ],
      child: MaterialApp(
        title: 'Gomuflix',
        theme: ThemeData.dark().copyWith(
          colorScheme: themeColor,
          primaryColor: blackColor,
          scaffoldBackgroundColor: blackColor,
        ),
        home: GomuflixSplashScreen(),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case GomuflixSplashScreen.routeName:
              return MaterialPageRoute(
                  builder: (_) => const GomuflixSplashScreen());

            case GomuflixTvMainScreen.routeName:
              return MaterialPageRoute(builder: (_) => GomuflixTvMainScreen());
            case GomuflixMovieMainScreen.routeName:
              return MaterialPageRoute(
                  builder: (_) => GomuflixMovieMainScreen());
            //
            case GomuflixMoviePopularScreen.routeName:
              return CupertinoPageRoute(
                  builder: (_) => GomuflixMoviePopularScreen());
            case GomuflixMovieTopRatedScreen.routeName:
              return CupertinoPageRoute(
                  builder: (_) => GomuflixMovieTopRatedScreen());
            case GomuflixMovieDetailScreen.routeName:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => GomuflixMovieDetailScreen(id: id),
                settings: settings,
              );

            case GomuflixTvPopularScreen.routeName:
              return CupertinoPageRoute(
                  builder: (_) => GomuflixTvPopularScreen());
            case GomuflixTvTopRatedScreen.routeName:
              return CupertinoPageRoute(
                  builder: (_) => GomuflixTvTopRatedScreen());
            case GomuflixTvDetailScreen.routeName:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => GomuflixTvDetailScreen(id: id),
                settings: settings,
              );

            case GomuflixSearchScreen.routeName:
              return CupertinoPageRoute(builder: (_) => GomuflixSearchScreen());
            case GomuflixWatchlistScreen.routeName:
              return MaterialPageRoute(
                  builder: (_) => GomuflixWatchlistScreen());
            case GomuflixAboutScreen.routeName:
              return MaterialPageRoute(builder: (_) => GomuflixAboutScreen());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
