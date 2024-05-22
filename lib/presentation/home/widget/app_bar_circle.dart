import 'package:booksy/presentation/category/category.dart';
import 'package:flutter/material.dart';

import 'circle_container.dart';

class AppBarCircles extends StatelessWidget {
  const AppBarCircles({super.key,required this.list});
  final List ? list;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return SizedBox(
      height: height*.15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list!.length,
          itemBuilder: (c, i) {
            return Padding(
              padding:  EdgeInsets.only(left: width*.0555555555555556),
              child:  InkWell(onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context1) =>   CategoryPage(type: list![i]["type"]),
                    ));
              },child: CircleContainer(map: list![i])),
            );
          }),
    );
  }
}
