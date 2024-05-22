import 'package:flutter/material.dart';

class UserData extends StatelessWidget {
  const UserData({super.key,required this.map});
  final Map ? map;
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
            decoration:map!["image"]==null? const BoxDecoration(
                color:Colors.grey,
                shape: BoxShape.circle,
            ): BoxDecoration(
              color:Colors.grey,
              shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage(map!["image"]))
            ),
          ),
          const SizedBox(width: 10,),
           Text(map!["name"] == null? "shop" :map!["name"]),
        ],
      ),
    );
  }
}
