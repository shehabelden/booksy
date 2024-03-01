import 'package:flutter/material.dart';
import '../../salon_screen/cubit/cubit.dart';
class Booking extends StatelessWidget {
  const Booking({super.key,required this.map});
  final Map ? map;
  @override
  Widget build(BuildContext context) {
    SalonCubit cubit=SalonCubit.get(context);
    return Container(
      padding:const EdgeInsets.only(left: 20.0,top: 20),
      height: 90,
      child: Row(
        children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:const EdgeInsets.only(left: .0),
              child: Text(map!["price"].toString(),style:const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
            ),
            Text("${map!["tim"].toString()}m",style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            )),
          ],
        ),
        const  SizedBox(width: 160,),
        InkWell(
          onTap: (){
            cubit.addBookingCubit({
              "date":cubit.date,
              "shop_name":"shop",
              "name":"shehab",
              "status":"pendding",
              "price": map!["price"],
              "serv":map!["name"],
              "hours":cubit.time,
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('booking is done'),
                action: SnackBarAction(
                  label: 'view',
                  onPressed: () {
                    // Code to execute.
                  },
                ),
              ),
            );
          },
          child: Container(
          height: 40,
          width:80 ,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color:const Color(0xff00a3ad),
          ),
          child:const Text("book",style: TextStyle(
              color: Colors.white
          )),
        ),),
      ],
    ),);

  }
}
