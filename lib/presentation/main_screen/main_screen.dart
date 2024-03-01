import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import '../home/cubit/cubit.dart';
import '../home/cubit/state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    MainCubit cubit=MainCubit.get(context);
    return BlocBuilder<MainCubit,MainState>(
        builder: (context,state) {
        return Scaffold(
          body: cubit.listCont[cubit.count],
          bottomNavigationBar:BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.grey.shade900,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                    IconlyLight.home,
                    color: Colors.grey.shade400),
                label: AppLocalizations.of(context)!.home,
                activeIcon:const Icon(
                    IconlyLight.home,
                    color: Colors.white),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                    IconlyLight.calendar,
                    color: Colors.grey.shade400),
                label: AppLocalizations.of(context)!.my_booking,
                activeIcon:const  Icon(
                    IconlyLight.calendar,
                    color: Colors.white),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                    IconlyLight.profile,
                    color: Colors.grey.shade400),
                label: AppLocalizations.of(context)!.profile,
                activeIcon:const  Icon(
                    IconlyLight.profile,
                    color: Colors.white),
              ),
            ],
            currentIndex :cubit.count,
            selectedItemColor:Colors.white,
            onTap:(index){
              cubit.countCubit(index);
            },
          ),

        );
      }
    );
  }
}
