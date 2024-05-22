import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../profile/cubit/cubit.dart';
import '../profile/cubit/state.dart';
import 'widget/shop_booking_card.dart';
class MyShopBookingList extends StatelessWidget {
  const MyShopBookingList({super.key});
  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit=ProfileCubit.get(context);
    cubit.getBookingProfile();
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return  BlocBuilder<ProfileCubit,ProfileMainState>(
          builder: (context,state) {
            return state is EmptyBookingState || cubit.myBookingList.isEmpty? const Center(child: CircularProgressIndicator(),) :
            Padding(
              padding:  EdgeInsets.only(top: height*.0625,right:
              width*.0555555555555556,left: width*.0555555555555556),
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: cubit.myBookingList.length,
                  itemBuilder:(context,index){
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: MyBookingShopCard(mapCard:cubit.myBookingList[index],userMap:cubit.mapProfile,id:cubit.myShopBookingIdList[index],),
                    );
                  }),
            );
          }
    );
  }
}