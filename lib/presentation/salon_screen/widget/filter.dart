import 'package:flutter/material.dart';

import '../cubit/cubit.dart';
class FilterScreen extends StatelessWidget {
  FilterScreen({super.key,required this.id});
   final String ? id ;
  final List list =["Services","reviews","portfolio","details"];
  final List list1 =["Services","commintes","protfolio","info",];

  @override
  Widget build(BuildContext context) {
    SalonCubit cubit= SalonCubit.get(context);
    return SizedBox(
      height: 40,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (c,i){
            return  Padding(
              padding:const  EdgeInsets.only(right: 20.0),
              child: InkWell(
                onTap: (){
                  cubit.chose(i);
                  cubit.statusCubit(id,list1[i]);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      list[i],
                    ),
                   const SizedBox(
                      height: 20,
                      width: 60,
                      child: Divider(
                        color: Colors.black,
                        thickness:1.3,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );

  }
}
