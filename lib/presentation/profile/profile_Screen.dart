import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';
import 'shop_profile.dart';
import 'user_profile.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit=ProfileCubit.get(context);
    cubit.getProfile();
    return Scaffold(
      body:BlocBuilder<ProfileCubit,ProfileMainState>(
          builder: (context,state) {
          return cubit.mapProfile["type"]=="costmer" ? const UserProfileScreen() : const ShopProfile();
        }
      ),
    );
  }
}
