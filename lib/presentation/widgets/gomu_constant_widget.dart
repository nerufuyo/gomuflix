import 'package:flutter/material.dart';
import 'package:gomuflix/common/style.dart';

class TitleRedLine extends StatelessWidget {
  const TitleRedLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 25,
      width: 2,
      child: DecoratedBox(decoration: BoxDecoration(color: lightRedColor)),
    );
  }
}

class TitleDivider extends StatelessWidget {
  const TitleDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 5);
  }
}

class TitleGreyLine extends StatelessWidget {
  const TitleGreyLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 2,
      width: 100,
      child: DecoratedBox(decoration: BoxDecoration(color: Colors.grey)),
    );
  }
}

class ContentDivider extends StatelessWidget {
  const ContentDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 10);
  }
}
