import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/cubit/cubit.dart';
import '../home/cubit/state.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    TextEditingController text=TextEditingController();
    MainCubit cubit=MainCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<MainCubit,MainState>(
          builder: (context,state) {
          return SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.only(top: 20,left: width*.0277777777777778, right: width*.0277777777777778),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                   padding:  EdgeInsets.only(bottom: 20.0),
                   child:  Text("Search",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                 ),
                  TextField(
                    controller: text,
                  decoration: InputDecoration(
                    prefix: Icon(
                      Icons.search,
                      color: Colors.grey.shade400,
                    ),
                    label: Text(
                      AppLocalizations.of(context)!.find_best_vaccinate_treatment,
                      style: GoogleFonts.manrope(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xffCACACA)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                    onChanged: (text){
                      cubit.searchCubit(text);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,left: 10),
                    child: SizedBox(
                      height: 300,
                      width: 360,
                      child: ListView.builder(
                          itemCount:cubit.searchList.length ,
                          itemBuilder: (c,i){
                            return Text("${cubit.searchList[i]}",
                              style: GoogleFonts.manrope(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffCACACA)),
                            );
                      }),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
