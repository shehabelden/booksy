import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/theme/container/large_container.dart';
import '../salon_screen/salon_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';
class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key,required this.type});
  final String ? type;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    CategoryCubit cubit=CategoryCubit.get(context);
    // cubit.docList();
    cubit.shopCategoryCubit(type!);
    return BlocBuilder<CategoryCubit,CategoryMainState>(
        builder: (context,state) {
          return  state is ShopCategoryEmptyState || cubit.shopCategoryList.isEmpty ? const Center(child: CircularProgressIndicator(),) : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left:width*.0555555555555556,right: width*.0555555555555556 ),
                    child: SizedBox(
                      height: .3*height,
                      width: 1.111111111111111*width,
                      child: ListView.builder(
                          itemCount: cubit.shopCategoryList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            return  Padding(
                              padding: EdgeInsets.only(top: height*.0125),
                              child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>  SalonScreen(id: cubit.idCategoryList[i],mainRate:cubit.shopCategoryList[i]["rate"]),
                                        ));
                                  },
                                  child: LargeContainer(map:cubit.shopCategoryList[i],id: cubit.idCategoryList[i],)),
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

