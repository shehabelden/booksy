import 'package:booksy/presentation/book/service_manage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../profile/cubit/cubit.dart';
import '../profile/cubit/state.dart';
import 'my_booking_shoping.dart';
class MyBookingShop extends StatelessWidget {
  const MyBookingShop({super.key});
  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit=ProfileCubit.get(context);
    cubit.getBookingProfile();
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    List badges=[
      MyServicesScreen(),
      MyShopBookingList(),
    ];
    return  Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ProfileCubit,ProfileMainState>(
          builder: (context,state) {
          return Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(left:.1111111111111111*width),
                child: Row(
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            cubit.choseBookingCubit(0);
                          },
                          child: Container(
                            width: .2777777777777778*width,
                            alignment: Alignment.center,
                            child:const Text("booking list"),
                          ),
                        ),
                        SizedBox(
                          width: .2777777777777778*width,
                          child: Divider(
                            height: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: .1111111111111111*width,),
                    InkWell(
                      onTap: (){
                        cubit.choseBookingCubit(1);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: .4166666666666667*width,
                            alignment: Alignment.center,
                            child:const Text("services manage"),
                          ),
                           SizedBox(
                            width: .4166666666666667*width,
                            child: Divider(
                              height: .025*height,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // MyShopBooking(),
              badges[cubit.iBook],
              // state is EmptyBookingState || cubit.myBookingList.isEmpty? const Center(child: CircularProgressIndicator(),) :
              // Padding(
              //   padding:  EdgeInsets.only(top: height*.0625,right:
              //   width*.0555555555555556,left: width*.0555555555555556),
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //       physics:const NeverScrollableScrollPhysics(),
              //       itemCount: cubit.myBookingList.length,
              //       itemBuilder:(context,index){
              //         return Padding(
              //           padding: const EdgeInsets.only(top: 10.0),
              //           child: MyBookingCard(mapCard:cubit.myBookingList[index],userMap:cubit.mapProfile),
              //         );
              //       }),
              // ),
            ],
          );
        }
      ),
    );
  }
}