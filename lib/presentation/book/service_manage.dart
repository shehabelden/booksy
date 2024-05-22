import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../profile/cubit/cubit.dart';
import '../profile/cubit/state.dart';
import 'widget/my_services.dart';
class MyServicesScreen extends StatelessWidget {
  const MyServicesScreen({super.key});
  @override
  Widget build(BuildContext context){
    ProfileCubit cubit=ProfileCubit.get(context);
    cubit.myBookingManageCubit();
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return  BlocBuilder<ProfileCubit,ProfileMainState>(
        builder: (context,state) {
          return state is EmptyStatusState || cubit.myBookingManageList.isEmpty ? const Center(child: CircularProgressIndicator(),) :
          SingleChildScrollView(
            physics:const NeverScrollableScrollPhysics(),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: cubit.myBookingManageList.length,
                      itemBuilder: (c,i){
                        return  Padding(
                          padding: EdgeInsets.only(top: 0.0,left: width*.0555555555555556,right: width*.0555555555555556),
                          child: MyServices(map:cubit.myBookingManageList[i],idShop: FirebaseAuth.instance.currentUser!.uid,idService: cubit.myBookingIdList[i],),
                        );
                      }),
                ],
              ),
            ),
          );
        }
    );
  }
}