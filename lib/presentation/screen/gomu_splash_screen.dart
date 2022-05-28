import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gomuflix/common/style.dart';
import 'package:gomuflix/presentation/screen/gomu_movie_main_screen.dart';

class GomuflixSplashScreen extends StatefulWidget {
  const GomuflixSplashScreen({Key? key}) : super(key: key);
  static const routeName = '/gomuflix-splash-screen';

  @override
  _GomuflixSplashScreenState createState() => _GomuflixSplashScreenState();
}

class _GomuflixSplashScreenState extends State {
  startTime() {
    var _duration = const Duration(seconds: 4);
    return Timer(_duration, navigationRoute);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  void navigationRoute() {
    Navigator.pushReplacementNamed(context, GomuflixMovieMainScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/logo.png',
                width: 150,
              ),
            ),
            Text('GOMUFLIX', style: superTitleText),
          ],
        ),
      ),
    );
  }
}
