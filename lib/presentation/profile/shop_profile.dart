import 'package:booksy/presentation/profile/screans/proto.dart';
import 'package:booksy/presentation/profile/screans/rate.dart';
import 'package:booksy/presentation/profile/screans/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';
import 'screans/about_as_screan.dart';
import 'widget/filter.dart';
import 'widget/profile_card.dart';
class ShopProfile extends StatelessWidget {
  const ShopProfile({super.key});
  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit=ProfileCubit.get(context);
    cubit.shopCubit();
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body:BlocBuilder<ProfileCubit,ProfileMainState>(
          builder: (context,state) {
            List badges=[
              ServicesProfileScreen(cubit: cubit,),
              RateShopProfile(list: cubit.myShopSer),
              ProtoScreen(cubit: cubit,),
              AboutAsMyShop(about: "", cubit: cubit,),
            ];
            return state is EmptyState || cubit.myShop.isEmpty ?
            const Center(child: CircularProgressIndicator(),) : SingleChildScrollView(
              child: SizedBox(
                height:height,
                child: Stack(
                  children: [
                    ProfileCard(map:cubit.myShop,cubit: cubit,),
                    Padding(
                      padding:const EdgeInsets.only(bottom: 540,),
                      child: Center(
                        child: InkWell(
                          onTap: ()async{
                            await cubit.addShopImage();
                          },
                          child: Container(
                            height: height* .125,
                            width: width *.2777777777777778,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.white,
                                  width: 4,
                              ),
                              image: DecorationImage(
                                  image: cubit.myShop["image"]!= null? NetworkImage(cubit.myShop["image"]) :const NetworkImage("https://firebasestorage.googleapis.com/v0/b/booksy-532e0.appspot.com/o/uploads%2F2024-03-02?alt=media&token=2f6b985b-db14-4fc0-a92f-712cda7c3e41"),
                                  fit: BoxFit.cover
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding:  EdgeInsets.only(top:350,left: 20),
                      child:  FilterProfileScreen(),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child:badges[cubit.i],
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: height*.875),
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                              colors: [Colors.white, Colors.white.withOpacity(0)], // Gradient colors
                              tileMode: TileMode.decal,
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter
                          ).createShader(bounds);
                        },
                        child: Container(
                          height: height*.175,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
