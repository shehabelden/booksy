import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Commint extends StatelessWidget {
  const Commint({super.key,required this.map});
  final Map ? map;
  @override
  Widget build(BuildContext context) {
    Timestamp  date=map!["date"];
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,top: 10,bottom: 20,right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration:  BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(map!["image"]),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Padding(
                padding:const  EdgeInsets.only(left: 20.0,right: 20.0),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${map!["name"]}"),
                    Text(map!.isEmpty ? "" :" ${date.toDate().day.toString()}/${date.toDate().month.toString()}/${date.toDate().year.toString()}",style:const TextStyle(

                    )),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemSize:12,
              itemCount: 5,
              itemPadding:const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Color(0xFFff9400),
              ),
              onRatingUpdate: (rating) {
                // print(rating);
              },
            ),
          ),
          const SizedBox(height: 30),
          // Text("service: ${map!["service"]}",style:const TextStyle(
          //     fontSize: 16
          // )),
          const SizedBox(height: 20),
          Text("${map!["commint"]}",style:const TextStyle(
            fontSize: 12,
          )),
        ],
      ),
    );
  }
}
