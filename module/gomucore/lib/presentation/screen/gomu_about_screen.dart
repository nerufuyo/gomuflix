import 'package:flutter/material.dart';
import 'package:gomucore/gomucore.dart';

class GomuflixAboutScreen extends StatefulWidget {
  const GomuflixAboutScreen({Key? key}) : super(key: key);
  static const routeName = '/gomuflix-about-screen';

  @override
  _GomuflixAboutScreenState createState() => _GomuflixAboutScreenState();
}

class _GomuflixAboutScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'About',
          style: titleText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 200,
            ),
            Text(
              'GOMUFLIX',
              style: superTitleText,
            ),
            Text(
              'Gomuflix is a film catalog application developed by Listyo Adi Pamungkas a.k.a nerufuyo as an application project to complete the class Becoming a Flutter Developer Expert.',
              style: nameText,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
