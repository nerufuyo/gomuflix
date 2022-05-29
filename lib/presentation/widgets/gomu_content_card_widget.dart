import 'package:flutter/material.dart';
import 'package:gomuflix/common/style.dart';
import 'package:gomuflix/presentation/widgets/gomu_constant_widget.dart';

class GomuflixContentCardWidget extends StatelessWidget {
  const GomuflixContentCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      splashColor: darkRedColor,
      highlightColor: bloodRedColor,
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/profile.png',
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Title',
                    style: subTitleText,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      const ContentDivider(),
                      const SizedBox(
                        width: 5,
                      ),
                      const ContentDivider(),
                      Text(
                        'Rate',
                        style: nameText,
                      ),
                    ],
                  ),
                  Text(
                    'Description',
                    style: subNameText,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
