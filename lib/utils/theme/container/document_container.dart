import 'package:flutter/material.dart';

class DocumentContainer extends StatelessWidget {
  const DocumentContainer({super.key,required this.map});
  final Map <String, dynamic> ? map;
  @override
   Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Container(
      height: height*.225,
      width: width*.3611111111111111,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding:  EdgeInsets.only(top: height*.05),
      child: Column(
        children: [
          Container(
            height: 75,
            width: 75,
            decoration:  BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(map!["image"]),
                  fit: BoxFit.cover,
                )),
          ),
           Text(map!["name"]),
        ],
      ),
    );
  }
}