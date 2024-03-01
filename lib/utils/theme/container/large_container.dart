import 'package:flutter/material.dart';

class LargeContainer extends StatelessWidget {
  const LargeContainer({super.key,required this.map});
  final Map <String,dynamic> ? map ;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return SizedBox(
      height: height*.3,
      width: width*.8888888888888889,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: .25*height,
                width: width*.8333333333333333,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image:  DecorationImage(
                      image: NetworkImage(map!["image"]),
                      fit: BoxFit.cover,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 220.0),
                child: Container(
                  height: height*.075,
                  width: width*.2222222222222222,
                  alignment: Alignment.center,
                  child: Text(map!["rate"].toString(),style: TextStyle(
                      color: Colors.white
                  ),),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

            ],
          ),
          Text(
            map!["name"],
            style:const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
