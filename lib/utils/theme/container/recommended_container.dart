import 'package:flutter/material.dart';

class RecommendedContainer extends StatelessWidget {
  const RecommendedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Container(),
          const Text("post"),
        ],
      ),
    );
  }
}
