import 'package:flutter/material.dart';

class DocumentHeader extends StatelessWidget {
  const DocumentHeader({super.key,required this.name});
  final String ? name;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Container(
      height: height*.375,
      width: double.infinity,
      color: Colors.white,
      alignment: Alignment.center,
      child:  Text(name!,
          style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
    );
  }
}
