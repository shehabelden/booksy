import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../cubit/cubit.dart';
class FilterProfileScreen extends StatelessWidget {
  const FilterProfileScreen({super.key,});
  @override
  Widget build(BuildContext context) {
    final List list =[AppLocalizations.of(context)!.services,
      AppLocalizations.of(context)!.reviews,
      AppLocalizations.of(context)!.portfolio,
      AppLocalizations.of(context)!.about_us,
    ];
    ProfileCubit cubit= ProfileCubit.get(context);
    final List list1 =["Services","commintes","protfolio","info",];
    if(cubit.i==0){
      cubit.statusCubit("Services");
    }
    return SizedBox(
      height: 40,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (c,i){
            return  Padding(
              padding:const  EdgeInsets.only(right: 20.0),
              child: InkWell(
                onTap: (){
                   cubit.choseCubit(i);
                   cubit.statusCubit(list1[i]);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      list[i],
                    ),
                    const SizedBox(
                      height: 20,
                      width: 60,
                      child: Divider(
                        color: Colors.black,
                        thickness:1.3,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );

  }
}
