import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../book/book_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ServicesContainer extends StatelessWidget {
  const ServicesContainer({super.key,required this.idService,required this.idShop,required this.map});
  final String ? idShop;
  final String ? idService;
  final Map ? map;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Container(
      height: height/10,
      width: double.infinity,
      color:Colors.white,
      alignment: Alignment.center,
      padding:const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            children: [
                SizedBox(
                  width: 150,
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
                padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>  BookScreen(idShop: idShop,idService: idService,),
                        ));
                  },
                  child: Container(
                    width: 80,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color:const Color(0xff00a3ad),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child:const Text("Book",style: TextStyle(
                        color: Colors.white
                    ),),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:const  EdgeInsets.only(right: 20.0),
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
