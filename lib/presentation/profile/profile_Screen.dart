import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';
import 'widget/body.dart';
import 'widget/profile_card.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit=ProfileCubit.get(context);
    cubit.getProfile();
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body:BlocBuilder<ProfileCubit,ProfileMainState>(
          builder: (context,state) {
          return state is EmptyState || cubit.mapProfile.isEmpty ?
          const Center(child: CircularProgressIndicator(),) : SingleChildScrollView(
            child: SizedBox(
              height:height ,
              child: Stack(
                children: [
                  Column(
                    children: [
                    ],
                  ),
                   ProfileCard(map:cubit.mapProfile),
                  Padding(
                    padding:const EdgeInsets.only(bottom: 540, ),
                    child: Center(
                      child: Container(
                        height: height* .125,
                        width: width *.2777777777777778,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 4
                          ),
                          image:const DecorationImage(
                            image: AssetImage("images/profile_test.jpeg"),
                            fit: BoxFit.cover
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: height*.125 ,
                    child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [Colors.blue, Colors.white.withOpacity(0)], // Gradient colors
                            tileMode: TileMode.clamp,
                          ).createShader(bounds);
                        },
                        child: Container(
                          height: height*.125,

                        )
                    ),
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
