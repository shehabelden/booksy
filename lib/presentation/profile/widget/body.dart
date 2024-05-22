import 'package:flutter/material.dart';

import '../cubit/cubit.dart';
import '../cubit/state.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key,required this.cubit});
  final ProfileCubit cubit;
  @override
  Widget build(BuildContext context) {
    return cubit.myShopSer.isEmpty ? const Center(child: CircularProgressIndicator(),) : Container(
      padding:const EdgeInsets.only(top: 100,left: 20,right: 20),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // number of columns
          crossAxisSpacing: 10, // spacing between columns
          mainAxisSpacing: 10, // spacing between rows
        ),
        itemCount: cubit.myShopSer.length, // number of items in the grid
        itemBuilder: (BuildContext context, int index) {
          return Container(
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
                image: DecorationImage(
                    image: NetworkImage(cubit.myShopSer[index]["image"]),
                    fit: BoxFit.cover
                )
            ),
          );
        },
      ),
    );
  }
}
