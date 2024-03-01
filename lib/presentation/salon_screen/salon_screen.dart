import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';
import 'screen/details.dart';
import 'screen/portfolio.dart';
import 'screen/rate.dart';
import 'widget/filter.dart';
import 'widget/services.dart';
class SalonScreen extends StatelessWidget {
  const SalonScreen({super.key,required this.id});
  final String ? id ;
  @override
  Widget build(BuildContext context) {
    SalonCubit cubit=SalonCubit.get(context);
    cubit.shopCubit(id);
    if(cubit.index==0){
      cubit.statusCubit(id,"Services");
    }
    return BlocBuilder<SalonCubit,SalonManeState>(
      builder: (context,state) {
        List list=  [ServicesScreen(list:cubit.shopList,id:id,idList: cubit.idServicesList),Rate(list:cubit.shopList,id:id), Portfolio(),Details(list:cubit.shopList,about:cubit.shopMap["about_as"],)];
        return Scaffold(
          body:state is EmptyState || cubit.shopList.isEmpty ?  const Center(child: CircularProgressIndicator(),) : Column(
            children: [
              Expanded(flex: 9,child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(cubit.shopMap["image"]),
                            fit: BoxFit.cover
                        ),
                      ),
                    ),
                  ),
                   Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding:const EdgeInsets.only(left: 20.0,right: 20.0),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 SizedBox(
                                   width: double.infinity,
                                   child: Row(
                                     children: [
                                        SizedBox(
                                          width: 220,
                                          child: Text(cubit.shopMap["name"],style:const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),),
                                        ),
                                       Row(
                                         children: [
                                           IconButton(onPressed: (){}, icon:const Icon(
                                             Icons.upload_outlined
                                           )),
                                           IconButton(onPressed: (){}, icon:const Icon(
                                               Icons.favorite_border
                                           )),
                                         ],
                                       ),
                                     ],
                                   ),
                                 ),
                                const SizedBox(height: 20),
                                  Text(cubit.shopMap["type"],style:const TextStyle(
                                  fontSize: 14
                                ),),
                                 Text(cubit.shopMap["address"],style:const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey
                                ),),
                                const SizedBox(height: 20,),
                                FilterScreen(id:id),
                              ],),
                            const SizedBox(height: 20,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),),
              Expanded(
                flex:10,
                child:state is EmptyStatusState ? const Center(child: CircularProgressIndicator(),) : list[cubit.index],
              )
            ],
          ),
        );
      }
    );
  }
}
