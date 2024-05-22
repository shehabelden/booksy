import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../profile/cubit/cubit.dart';
import '../profile/cubit/state.dart';
import 'my_book_user.dart';
import 'my_booking_shop.dart';
class CheckBookingScreen extends StatelessWidget {
  const CheckBookingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit=ProfileCubit.get(context);
    cubit.getProfile();
    return Scaffold(
      body:BlocBuilder<ProfileCubit,ProfileMainState>(
          builder: (context,state) {
            return cubit.mapProfile["type"]=="costmer"?
            const MyBookingUser() : const MyBookingShop();
          }
      ),
    );
  }
}