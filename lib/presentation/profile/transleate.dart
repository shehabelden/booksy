import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/cubit/cubit.dart';
import '../home/cubit/state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TransleteScreen extends StatelessWidget {
  const TransleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainCubit cubit=MainCubit.get(context);
    return  BlocBuilder<MainCubit,MainState>(
        builder: (context,state) {
        return Scaffold(
          body: Stack(
            children: [
              Image.asset("images/tran.jpg",
                height: double.infinity,
                width: double.infinity,
                fit:BoxFit.cover ,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200.0,left: 120,right: 120),
                child: Text(AppLocalizations.of(context)!.choose_the_language,style:const TextStyle(
                  color: Colors.black,
                  fontSize: 20
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 400.0,left: 100,right: 100),
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        cubit.trnsleteCubit("en");
                      },
                      child: Container(
                        width: 60,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.black,
                            )
                        ),
                        child: Text("en",style: TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        ),),
                      ),
                    ),
                   const SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        cubit.trnsleteCubit("ar");
                      },
                      child: Container(
                        width: 60,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.black,
                            )
                        ),
                        child: Text("ar",style: TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        ),),
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 460.0,left: 100,right: 100),
                child: InkWell(
                  onTap: (){
                    cubit.trnsleteCubit("fr");
                  },
                  child: Container(
                    width: 60,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.black,
                        )
                    ),
                    child:const Text("fr",style: TextStyle(
                        color: Colors.black,
                        fontSize: 20
                    ),),
                  ),
                ),
              ),

            ],
          ),
        );
      }
    );
  }
}
