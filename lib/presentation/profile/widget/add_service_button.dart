import 'package:flutter/material.dart';
import '../../../utils/theme/controllers/controllers.dart';
import '../cubit/cubit.dart';
import 'type_list.dart';
class AddServiceButton extends StatelessWidget {
  const AddServiceButton({super.key,required this.cubit});
  final ProfileCubit cubit;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding:  EdgeInsets.only(top: .4375*height,left: .0555555555555556*width),
      child: InkWell(
        onTap: (){
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
                            Text("price")),
                        controller: Controllers.price,
                      ),
                      TextField(
                        decoration:const InputDecoration(
                            label: Text("time")),
                        controller: Controllers.time,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                        child: DropDownTypeList(
                            list:const [
                              "x",
                              "y",
                            ],
                            value:cubit.type,
                            fun: cubit,
                            width: .2777777777777778*width),
                      ),
                      InkWell(
                        onTap: () {
                          cubit.addServices({
                            "tim":Controllers.time.text,
                            "price":Controllers.price.text,
                            "name":Controllers.name.text,
                            "type":cubit.type,
                          });
                        },
                        child: Container(
                          width: .2777777777777778*width,
                          height: .05*height,
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
        child: Container(
          alignment: Alignment.center,
          height: .075*height,
          width: .075*height,
          decoration: const BoxDecoration(
              color: Color(0xFF43def0),
              shape: BoxShape.circle
          ),
          child:const Text("+",style: TextStyle(
            color: Colors.white,
          ),),
        ),
      ),
    );
  }
}