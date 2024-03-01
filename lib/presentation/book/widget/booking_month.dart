import 'package:flutter/material.dart';
import '../../../utils/var/list.dart';
class BookingWeek extends StatelessWidget {
  const BookingWeek({super.key,required this.month});
  final String ? month ;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text("${month!.toString()} 2024",style: const TextStyle(
          fontSize: 20,
        )),
        const SizedBox(height: 30,),
        SizedBox(
          height: 20,
          child: ListView.builder(
              itemCount: MainList.days.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (c,i){
                return Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: SizedBox(
                    height: 20,
                    child:Text(MainList.days[i],style:const TextStyle(
                        color: Colors.grey
                    ),),),
                );
              }),
        ),
      ],
    );

  }
}
