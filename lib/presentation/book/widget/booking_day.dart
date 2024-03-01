import 'package:flutter/material.dart';

import '../../../utils/var/list.dart';

class BookingDays extends StatelessWidget {
  const BookingDays({super.key,required this.days,required this.index});
  final String ? days ;
  final int ? index ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 30),
      child: Container(
        height: 150,
        alignment: Alignment.center,
        child: Row(
          children: [
            Expanded(
              flex: 10,
              child: GridView.builder(
                itemCount: MainList.monthsAndDay[index!][days!].length,
                shrinkWrap: true,
                itemBuilder: (c,i){
                  return Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Container(
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      // alignment: Alignment.center,
                      decoration:const BoxDecoration(
                          color: Color(0xff00a3ad),
                          shape: BoxShape.circle
                      ),
                      child:Text("${MainList.monthsAndDay[index!][days!][i]}",style:const TextStyle(
                          color: Colors.white
                      ),),),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 10,

                  // mainAxisExtent:
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
