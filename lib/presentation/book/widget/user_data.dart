import 'package:flutter/material.dart';

class UserData extends StatelessWidget {
  const UserData({super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20),
      child: Row(
        children: [
          Container(
            height: height/20,
            width: height/20,
            decoration:const BoxDecoration(
              color:Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10,),
          const Text("shehab"),
        ],
      ),
    );
  }
}
