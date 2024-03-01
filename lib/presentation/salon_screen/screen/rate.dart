import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../cubit/cubit.dart';
import '../cubit/state.dart';
import '../widget/commint.dart';

class Rate extends StatelessWidget {
  const Rate({super.key,required this.list,required this.id});
  final List ? list;
  final String ? id;

  @override
  Widget build(BuildContext context) {
    SalonCubit cubit= SalonCubit.get(context);
    return  BlocBuilder<SalonCubit,SalonManeState>(
        builder: (context,state) {
        return SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   children: [
                      Padding(
                        padding:const EdgeInsets.only(left: 20.0,right: 20),
                        child: Column(
                          children: [
                          const Text("5.0",style: TextStyle(
                             fontSize: 40
                           ),
                           ),
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemSize: 15,
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
                           const Text("322 reviews",style: TextStyle(
                              fontSize: 15,
                             color: Colors.grey
                            )),
                          ],
                        ),
                      ),
                   ],
                 ),
                const Padding(
                  padding:  EdgeInsets.only(left: 20.0,top: 20,right: 20),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Reviews",style: TextStyle(
                        fontSize: 18,
                      )),
                      SizedBox(
                        width: 300,
                          child: Text(
                              "Opinie, przy których widoczny jest znacznik „Zweryfikowany użytkownik Booksy” to opinie, co do których Booksy zapewnia, że pochodzą od zarejestrowanych użytkowników Booksy, którzy faktycznie skorzystali z danej usługi. Wyłącznie po zrealizowaniu danej usługi, zarejestrowany użytkownik Booksy uzyskuje możliwość opublikowania opinii.",style: TextStyle(
                              color: Colors.grey
                          ),)),
                    ],
                  ),
                ),
                 ListView.builder(
                     shrinkWrap: true,
                     physics:const NeverScrollableScrollPhysics(),
                     itemCount: list!.length,
                     itemBuilder: (context,i) {
                       return Commint(map: list![i],);
                   }
                 ),
               ],
             ),
        );
      }
    );
  }
}
