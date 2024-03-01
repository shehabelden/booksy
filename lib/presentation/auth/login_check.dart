import 'package:booksy/presentation/auth/login_screen.dart';
import 'package:booksy/presentation/profile/profile_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/state.dart';
// state is EmptyLoginState? const Center(child: CircularProgressIndicator(),) :
class LoginCheck extends StatelessWidget {
  const LoginCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthMainState>(
        builder: (context,state) {
         if(state is EmptyLoginState){
           return const Center(child: CircularProgressIndicator(),);
         }
        if(FirebaseAuth.instance.currentUser == null){
          return const LoginScreen();
        }else{
          return const ProfileScreen();}
      }
    );
  }
}
