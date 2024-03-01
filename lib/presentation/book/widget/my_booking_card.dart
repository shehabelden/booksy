import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'user_data.dart';

class MyBookingCard extends StatelessWidget {
  const MyBookingCard({super.key,required this.mapCard});
  final Map ? mapCard ;
  @override
  Widget build(BuildContext context) {
    Timestamp date= mapCard!["date"];
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Container(
      height: height*.225,
      width: width *.9444444444444444,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: width*.0555555555555556,top: height* .025,right: width*.0555555555555556),
            child: Row(
              children: [
                Expanded(
                  flex:3,
                  child: Text("${mapCard!["name"]}",style:const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
                ),
                Expanded(
                  flex:1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: Text("${mapCard!["price"]}",style:const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                       Text("${mapCard!["hours"]}",style:const TextStyle(
                          color: Colors.grey
                      )),

                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade300,
            height: height*.0125,
          ),
           SizedBox(
            height: height*.025,
          ),
          Row(
            children: [

              const Expanded(flex:3,child: UserData()),
              Expanded(flex:1,child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${mapCard!["shop_name"]}",style:const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                    Text("${date.toDate().day.toString()}/${date.toDate().month.toString()}/${date.toDate().year.toString()}",style:const TextStyle(
                    )),
                  ],
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}