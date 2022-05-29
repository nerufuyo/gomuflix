import 'package:flutter/material.dart';
import 'package:gomuflix/common/style.dart';
import 'package:gomuflix/presentation/widgets/gomu_constant_widget.dart';
import 'package:gomuflix/presentation/widgets/gomu_content_card_widget.dart';

class GomuflixSearchScreen extends StatefulWidget {
  const GomuflixSearchScreen({Key? key}) : super(key: key);
  static const routeName = '/gomuflix-search-screen';

  @override
  _GomuflixSearchScreenState createState() => _GomuflixSearchScreenState();
}

class _GomuflixSearchScreenState extends State {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: lightRedColor,
            size: 30,
          ),
        ),
        title: Text(
          'Watchlist',
          style: titleText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search movies and tv',
                prefixIcon: Icon(Icons.search_rounded),
              ),
            ),
            const ContentDivider(),
            Row(
              children: [
                const TitleRedLine(),
                const TitleDivider(),
                Text(
                  'Result',
                  style: subTitleText,
                ),
              ],
            ),
            const ContentDivider(),
            Column(
              children: const [
                GomuflixContentCardWidget(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
