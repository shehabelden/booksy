import 'package:flutter/material.dart';

import 'user_data.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({super.key,required this.mapCard});
  final Map ? mapCard ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding:const EdgeInsets.only(left: 20.0,top: 20.0),
            child: Row(
              children: [
                Expanded(
                  flex:1,
                  child: Text("${mapCard!["name"]}",style:const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
                ),
                Expanded(
                  flex:1,
                  child: Column(
                    children: [
                      Padding(
                        padding:const EdgeInsets.only(left: 70.0),
                        child: Text("${mapCard!["price"]}",style:const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                      const Text("10.30AM-10.35AM",style: TextStyle(
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
            height: 10,
          ),
          const SizedBox(
            height: 20,
          ),
         const  UserData(),
        ],
      ),
    );
  }
}