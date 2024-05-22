import 'package:booksy/presentation/main_screen/main_screen.dart';
import 'package:booksy/utils/theme/controllers/controllers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';
import '../widget/commint.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Rate extends StatelessWidget {
  const Rate({super.key,required this.list,required this.id,required this.mainRate});
  final List ? list;
  final String ? id;
  final double ? mainRate;
  @override
  Widget build(BuildContext context) {
    SalonCubit cubit= SalonCubit.get(context);
    cubit.getProfile();
    return  BlocBuilder<SalonCubit,SalonManeState>(
        builder: (context,state) {
        return SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   children: [
                      Padding(
                        padding:const EdgeInsets.only(left: 20.0,right: 20),
                        child: Column(
                          children: [
                           Text((mainRate!).toString(),style:const TextStyle(
                             fontSize: 40
                           ),
                           ),
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemSize: 15,
                              itemCount: 5,
                              itemPadding:const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Color(0xFFff9400),
                              ),
                              onRatingUpdate: (rating) {
                                cubit.getMyRate(rating);
                                },
                            ),
                            Text("${list!.length} ${AppLocalizations.of(context)!.reviews}",style:const TextStyle(
                              fontSize: 15,
                             color: Colors.grey
                            )),
                          ],
                        ),
                      ),
                   ],
                 ),
                 Padding(
                  padding:const  EdgeInsets.only(left: 20.0,top: 20,right: 20),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.reviews,style:const TextStyle(
                        fontSize: 18,
                      )),
                      SizedBox(
                        width: 300,
                          child: Text(
                              "Opinie, przy których widoczny jest znacznik „Zweryfikowany użytkownik Booksy” to opinie, co do których Booksy zapewnia, że pochodzą od zarejestrowanych użytkowników Booksy, którzy faktycznie skorzystali z danej usługi. Wyłącznie po zrealizowaniu danej usługi, zarejestrowany użytkownik Booksy uzyskuje możliwość opublikowania opinii.",style: TextStyle(
                              color: Colors.grey
                          ),)),
                    ],
                  ),
                ),
                 FirebaseAuth.instance.currentUser!.uid.isNotEmpty ? Padding(
                   padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
                   child: TextField(
                     maxLines: 2,
                     controller: Controllers.commitmentController,
                     decoration: InputDecoration(
                       hintText: AppLocalizations.of(context)!.pleas_add_commitment,
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20),
                       )
                     ),
                   ),
                 ) :Text(""),
                 FirebaseAuth.instance.currentUser!.uid.isNotEmpty? Row(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     InkWell(
                       onTap: ()async{
                         await cubit.addCommintCubit({
                           "commint":Controllers.commitmentController.text,
                           "id":FirebaseAuth.instance.currentUser!.uid ,
                           "date":DateTime.now(),
                           "name":cubit.mapProfile["name"],
                           "image":cubit.mapProfile["image"],
                            "rate":cubit.rate,
                         },id!,(cubit.rate+mainRate!)/list!.length);
                         Navigator.of(context).push(
                             MaterialPageRoute(
                               builder: (context) => const  MainScreen(),
                             ));
                       },
                       child: Padding(
                         padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
                         child: Container(
                           width: 60,
                           height: 40,
                           alignment: Alignment.center,
                           decoration: BoxDecoration(
                               color:Color(0xff00a3ad),
                               borderRadius: BorderRadius.circular(12)
                           ),
                           child: Text(AppLocalizations.of(context)!.submit,
                               style:const TextStyle(
                             color: Colors.white
                           )),
                         ),
                       ),
                     ),
                   ],
                 ) :Text(""),

                  ListView.builder(
                     shrinkWrap: true,
                     physics:const NeverScrollableScrollPhysics(),
                     itemCount: list!.length,
                     itemBuilder: (context,i) {
                       return list![i].isEmpty ? Text(""): Commint(map: list![i],);
                   }
                 ),
               ],
             ),
        );
      }
    );
  }
}
