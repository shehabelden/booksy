import 'package:flutter/material.dart';

import '../../salon_screen/cubit/cubit.dart';

class BookingHour extends StatelessWidget {
  const BookingHour({super.key,required this.list});
  final List ? list;

  @override
  Widget build(BuildContext context) {
    SalonCubit cubit=SalonCubit.get(context);
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 20,bottom: 20, ),
      child: SizedBox(
        height: height *.05,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding:  EdgeInsets.only(left:width*.0555555555555556),
            itemCount: list!.length,
            itemBuilder: (context,i) {
              return Padding(
                padding:  EdgeInsets.only(right: width*.0555555555555556),
                child: InkWell(
                  onTap: ()async{
                   await cubit.choseTime(i,list![i]["time"]);
                  },
                  child: Container(
                    height: height* .0375,
                    width: width*.2222222222222222,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color:cubit.indexBooking == i? const Color(0xff00a3ad) : Colors.white ,
                        borderRadius: BorderRadius.circular(20)
                    ),

                    child:Text("${list![i]["time"]}",style: TextStyle(
                        color:cubit.indexBooking == i? Colors.white : Colors.black
                    ),),),
                ),
              );
            }
        ),
      ),
    );
  }
}
