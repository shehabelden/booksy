import 'package:flutter/material.dart';

import 'circle_container.dart';

class AppBarCircles extends StatelessWidget {
  const AppBarCircles({super.key});
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return SizedBox(
      height: height*.15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (c, i) {
            return Padding(
              padding:  EdgeInsets.only(left: width*.0555555555555556),
              child: const CircleContainer(),
            );
          }),
    );
  }
}
