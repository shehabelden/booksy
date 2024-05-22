import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../utils/theme/controllers/controllers.dart';
import '../../profile/cubit/cubit.dart';
class MyServices extends StatelessWidget {
  const MyServices({super.key,required this.idService,required this.idShop,required this.map});
  final String ? idShop;
  final String ? idService;
  final Map ? map;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    ProfileCubit cubit=ProfileCubit.get(context);
    return Container(
      height: height/10,
      width: double.infinity,
      color:Colors.white,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: .025*height),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: .2777777777777778*width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(map!["name"]),
                    Text(map!["type"].toString(),style:const TextStyle(
                        color: Colors.grey
                    )),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(map!["price"].toString(),style:const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  Text("${map!["tim"]} m",style:const TextStyle(
                      color: Colors.grey
                  ),
                  ),
                ],
              ),
              Padding(
                padding:  EdgeInsets.only(left: .0555555555555556*width,right: .0555555555555556*width),
                child: InkWell(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title:const Text("add Booking details"),
                          actions: [
                            Column(
                              children: [
                                TextField(
                                  decoration:const InputDecoration(
                                      label: Text("name")),
                                  controller: Controllers.name,
                                ),
                                TextField(
                                  decoration:const InputDecoration(
                                      label:
                                      Text("price")),
                                  controller: Controllers.price,
                                ),
                                TextField(
                                  decoration:const InputDecoration(
                                      label: Text("time to start")),
                                  controller: Controllers.timeToStart,
                                ),
                                TextField(
                                  keyboardType:const TextInputType.numberWithOptions(decimal: false),
                                  decoration:const InputDecoration(
                                      label: Text("time to end")),
                                  controller: Controllers.timeToEnd,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                                  child: Container(),
                                ),
                                InkWell(
                                  onTap: () {
                                    cubit.addServDetails({
                                      "start_time":Timestamp((int.parse(Controllers.timeToStart.text)-2)*3600, 0),
                                      "end_time":Timestamp((int.parse(Controllers.timeToEnd.text)-2)*3600, 0),
                                      "price":Controllers.price.text,
                                      "name":Controllers.name.text,
                                      "type":cubit.type,
                                    },idService);
                                  },
                                  child: Container(
                                    width: .3888888888888889*width,
                                    height: .05*height,
                                    decoration: BoxDecoration(
                                        color:const Color(0xFF43def0),
                                        borderRadius: BorderRadius.circular(12)
                                    ),
                                    alignment: Alignment.center,
                                    child:const Text("add Booking details",style: TextStyle(
                                        color: Colors.white
                                    ),),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                    );
                  },
                  child: Container(
                    width: width/3,
                    height: .05*height,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color:const Color(0xff00a3ad),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child:const Text("add booking data",style: TextStyle(
                        color: Colors.white
                    ),),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.only(right: .0555555555555556*width),
            child: Divider(
              thickness: 1,
              color: Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
