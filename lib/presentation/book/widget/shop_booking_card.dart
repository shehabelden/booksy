import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../profile/cubit/cubit.dart';
import 'user_data.dart';
class MyBookingShopCard extends StatelessWidget {
  const MyBookingShopCard({super.key,required this.mapCard,required this.userMap, required this.id});
  final Map ? mapCard ;
  final Map ? userMap ;
  final String ? id ;
  @override
  Widget build(BuildContext context) {
    Timestamp date= mapCard!["date"];
    ProfileCubit  cubit=ProfileCubit.get(context);
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Container(
      height: height*.325,
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
                        padding:EdgeInsets.only(left: .0277777777777778*width,right: .0277777777777778*width),
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
              Expanded(flex:3,child: UserData(map: userMap!,)),
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
          Padding(
            padding: const EdgeInsets.only(left: 40.0,right: 40,top: 40),
            child: Row(
              children: [
                InkWell(
                   onTap: (){
                     cubit!.updateBookingProfile(id,{
                       "status":"rejected"
                     });
                   },
                  child: Container(
                    height: .05*height,
                    width: .2222222222222222*width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:const Text("rejected",style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                ),
                SizedBox(width: .2222222222222222*width,),
                InkWell(
                  onTap: (){
                    cubit.updateBookingProfile(id,{
                      "status":"accepted"
                    });
                  },
                  child: Container(
                    height: .05*height,
                    width: .2222222222222222*width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xff00a3ad),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:const Text("accepted",style: TextStyle(
                        color: Colors.white
                    ),),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}