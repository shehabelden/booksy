import 'package:flutter/material.dart';
class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key,required this.map});
  final Map ? map;

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
                    child: Text("""
 """),
                  ),
                  Expanded(
                    flex:1 ,
                    child: Text("${map!["name"]}",style:const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    )),),

                  const Expanded(
                    flex:1 ,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0,top: 20),
                      child: Text(
                          """
 
                            """),
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
