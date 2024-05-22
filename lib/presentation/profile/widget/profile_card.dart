import 'package:booksy/presentation/profile/cubit/cubit.dart';
import 'package:booksy/presentation/profile/transleate.dart';
import 'package:flutter/material.dart';

import '../../../utils/theme/controllers/controllers.dart';
class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key,required this.map,required this.cubit});
  final Map ? map;
  final ProfileCubit cubit;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 130.0,left: 30,right: 30),
      child: Container(
        height: height/4,
        width: width*.8333333333333333,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:const EdgeInsets.only(top: 0.0,left: 40,right: 40),
              child: Row(
                children: [
                  const    Expanded(
                    flex:1 ,
                    child: SizedBox(
                      child: Text("""
 """),
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 30,),
                        InkWell(onTap: (){
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title:const Text("add new service"),
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
                                            Text("adress")),
                                        controller: Controllers.price,
                                      ),
                                      TextField(
                                        decoration:const InputDecoration(
                                            label: Text("about us")),
                                        controller: Controllers.time,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          cubit.shopUpdateCubit({
                                            "about_us":Controllers.time.text,
                                            "adress":Controllers.price.text,
                                            "name":Controllers.name.text,
                                          });
                                        },
                                        child: Container(
                                          width: 100,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Color(0xFF43def0),
                                              borderRadius: BorderRadius.circular(12)
                                          ),
                                          alignment: Alignment.center,
                                          child:const Text("add services",style: TextStyle(
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
                          child: Text("${map!["name"]}",style:const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          )),
                        ),
                        TextButton(onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const  TransleteScreen(),
                              ));
                        }, child:const Text("translate",style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                        ))),
                        Text("pendding",style: TextStyle(
                            color: Colors.red
                        ),),
                      ],
                    ),),
                  const Expanded(
                    flex:1 ,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0,top: 20),
                      child: SizedBox(
                        child: Text(
                            """
 
                            """),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Text("  ",style: TextStyle(
                color: Colors.grey
            ),),
          ],
        ),
      ),
    )
    ;
  }
}
