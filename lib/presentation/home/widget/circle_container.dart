import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({super.key,required this.map});
  final Map ? map ;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height:
          height*.125,
          width: height*.125,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.withOpacity(.5),
            image: DecorationImage(
              image: NetworkImage(map!["image"]),
              fit: BoxFit.cover
            ),
          ),
        ),
         Text(map!["type"]),
      ],
    );
  }
}
