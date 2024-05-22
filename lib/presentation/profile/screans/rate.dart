import 'package:booksy/presentation/main_screen/main_screen.dart';
import 'package:booksy/utils/theme/controllers/controllers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../salon_screen/widget/commint.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class RateShopProfile extends StatelessWidget {
  const RateShopProfile({super.key,required this.list,});
  final List ? list;
  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit= ProfileCubit.get(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Padding(
      padding:  EdgeInsets.only(top: height/2,),
      child: BlocBuilder<ProfileCubit,ProfileMainState>(
          builder: (context,state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: .0555555555555556*width,right: .0555555555555556*width),
                        child: Column(
                          children: [
                            Text(("0.0").toString(),style:const TextStyle(
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
                            width: .8333333333333333*width,
                            child: Text(
                              "Opinie, przy których widoczny jest znacznik „Zweryfikowany użytkownik Booksy” to opinie, co do których Booksy zapewnia, że pochodzą od zarejestrowanych użytkowników Booksy, którzy faktycznie skorzystali z danej usługi. Wyłącznie po zrealizowaniu danej usługi, zarejestrowany użytkownik Booksy uzyskuje możliwość opublikowania opinii.",style: TextStyle(
                                color: Colors.grey
                            ),)),
                      ],
                    ),
                  ),
                  list!.isEmpty ?  Center(child: Padding(
                    padding: EdgeInsets.only(top: .05/height),
                    child:const Text("No commintes yet "),
                  )):   ListView.builder(
                      shrinkWrap: true,
                      physics:const NeverScrollableScrollPhysics(),
                      itemCount: list!.length,
                      itemBuilder: (context,i) {
                        return list![i].isEmpty ? const Center(child: Text("No commintes yet ")): Commint(map: list![i],);
                      }
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
