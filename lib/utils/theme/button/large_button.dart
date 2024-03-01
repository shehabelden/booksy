import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  const LargeButton({super.key, required this.color, required this.text});
  final Color? color;
  final String? text;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Container(
      height: height* .0625,
      width: width*.7222222222222222,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color!,
        // border: Border.all(color: Colors.black, width: 1),
      ),
      child: Text(text!, style: const TextStyle(color: Colors.white)),
    );
  }
}
