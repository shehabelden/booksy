import 'package:flutter/material.dart';

import '../cubit/cubit.dart';

class AddProtoImage extends StatelessWidget {
  const AddProtoImage({super.key,required this.cubit});
  final ProfileCubit cubit ;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.only(bottom: height *.125),
      child: InkWell(
        onTap: (){
          cubit.addProtoImage();
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
