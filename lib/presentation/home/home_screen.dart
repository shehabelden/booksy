import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/theme/container/document_container.dart';
import '../../utils/theme/container/large_container.dart';
import '../document/document.dart';
import '../salon_screen/salon_screen.dart';
import '../search/search_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';
import 'widget/app_bar_circle.dart';
import '../../utils/theme/container/search.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    MainCubit cubit=MainCubit.get(context);
    cubit.docList();
    cubit.shopCubit();
    cubit.shopMainCubit();
    cubit.rateCont=0;
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return BlocBuilder<MainCubit,MainState>(
      builder: (context,state) {
        return  state is EmptyState || cubit.shopList == null  ? const Center(child: CircularProgressIndicator(),) : Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.black.withOpacity(.7),
                  height: height* .375,
                  width: double.infinity,
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height*.0625),
                        child: Text(AppLocalizations.of(context)!.continue_with_Facebook,
                            style:const TextStyle(
                              color: Colors.white,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height*.025),
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const  SearchScreen(),
                                ));
                          },
                            child:const Search(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height*.025, right: width*.0277777777777778),
                        child: AppBarCircles(list: cubit.shopMainList,),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left:width*.0555555555555556,right: width*.0555555555555556 ),
                  child: SizedBox(
                    height: .3*height,
                    width: 1.111111111111111*width,
                    child: ListView.builder(
                        itemCount: cubit.shopList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return  Padding(
                            padding: EdgeInsets.only(top: height*.0125),
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SalonScreen(id: cubit.idList[index],
                                              mainRate:cubit.shopList[index]["rate"]*1.0),
                                    ));
                              },
                                child: LargeContainer(map:cubit.shopList[index],id: cubit.idList[index],)),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: width *.0555555555555556,right:width*.0555555555555556),
                  child: SizedBox(
                    height: height*.225,
                    width: 1.111111111111111*width,
                    child: ListView.builder(
                        itemCount: cubit.categoryList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding:EdgeInsets.only(top: height*.0125, left: width*.0277777777777778, bottom: height*.0125,
                                right:width*.0555555555555556),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                  builder: (context) =>  DocumentList(category: cubit.categoryList[i]["name"],),
                                ));
                              },
                                child: DocumentContainer(map: cubit.categoryList[i]),
                            ),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left:width*.0555555555555556 ),
                  child: SizedBox(
                    height: .3*height,
                    width: 1.111111111111111*width,
                    child: ListView.builder(
                        itemCount: cubit.shopList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return  Padding(
                            padding: EdgeInsets.only(top: height*.0125),
                            child: InkWell(
                                onTap: (){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>  SalonScreen(id: cubit.idList[index],mainRate:cubit.shopList[index]["rate"]*1.0),
                                      ));
                                },
                                child: LargeContainer(map:cubit.shopList[index],id: cubit.idList[index],)),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
