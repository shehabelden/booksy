import 'package:flutter/material.dart';

import '../cubit/cubit.dart';

class AddInfo extends StatelessWidget {
  const AddInfo({super.key,required this.cubit});
  final ProfileCubit cubit ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        cubit.UpdateInfo({});
      },
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: 60,
        decoration: const BoxDecoration(
        ),
        child:const Text("+",style: TextStyle(
          color: Colors.white,
        ),),
      ),
    );
  }
}
