import 'package:flutter/material.dart';
class MyShopServicesContainer extends StatelessWidget {
  const MyShopServicesContainer({super.key,required this.map});
  final Map ? map;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height/10,
      width: double.infinity,
      color:Colors.white,
      alignment: Alignment.center,
      padding:const EdgeInsets.only(top: 20),
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: .5555555555555556*width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(map!["name"]),
                        Text(map!["type"].toString(),style:const TextStyle(
                            color: Colors.grey
                        )),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(map!["price"].toString(),style:const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                      Text("${map!["tim"]} m",style:const TextStyle(
                          color: Colors.grey
                      ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding:  EdgeInsets.only(right:0555555555555556*width ),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
