import 'package:flutter/material.dart';

class DocumentListContainer extends StatelessWidget {
  const DocumentListContainer({super.key,required this.map});
  final Map ? map;

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Padding(
      padding:  EdgeInsets.only(top: height*.025),
      child: Container(
        height: height*.75,
        width: width*.9722222222222222,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width*.9722222222222222,
              height: height*.25,
              decoration:  BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(map!["image"]), fit: BoxFit.cover),
              ),
            ),
             Padding(
              padding:const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(map!["name"],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(map!["hint"]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
