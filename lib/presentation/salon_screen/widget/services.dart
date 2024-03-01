import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';
import 'search_salon.dart';
import 'services_container.dart';
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key,required this.list,required this.id,required this.idList,});
  final List ? list;
  final List ? idList;
  final String ? id;
  @override
  Widget build(BuildContext context){
    SalonCubit cubit= SalonCubit.get(context);
    // cubit.statusCubit(id,"servese");
    return  BlocBuilder<SalonCubit,SalonManeState>(
        builder: (context,state) {
          return SingleChildScrollView(
          physics:const NeverScrollableScrollPhysics(),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SearchSalon(),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: list!.length,
                    itemBuilder: (c,i){
                      return  Padding(
                        padding:const EdgeInsets.only(top: 0.0,left: 20.0,right: 20.0),
                        child: ServicesContainer(map:list![i],idShop: id,idService: idList![i],),
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
//ServicesContainer(),