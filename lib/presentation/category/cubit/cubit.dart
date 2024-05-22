// shopCategoryCubit(type)async{
//   emit(ShopCategoryEmptyState());
//   await FirebaseFirestore.instance.collection("shope").get().then((value){
//     shopCategoryList=[];
//     idCategoryList=[];
//     value.docs.forEach((element) {
//       // print(element.data());
//       if(element.data()["type"] == type){
//         idCategoryList.add(element.id);
//         shopCategoryList.add(element.data());
//       }
//     });
//   });
//   print(shopCategoryList.toString());
//
//   emit(GetShopCategoryData());
// }
import 'package:booksy/presentation/category/cubit/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryMainState> {
  CategoryCubit() : super(GetShopMainCategoryData());
  List shopCategoryList=[];
  List idCategoryList=[];
  static CategoryCubit get(context) => BlocProvider.of(context);
  shopCategoryCubit(type)async{
    emit(ShopCategoryEmptyState());
    await FirebaseFirestore.instance.collection("shope").get().then((value){
      shopCategoryList=[];
      idCategoryList=[];
      value.docs.forEach((element) {
        // print(element.data());
        if(element.data()["type"] == type){
          idCategoryList.add(element.id);
          shopCategoryList.add(element.data());
        }
      });
    });
    print(shopCategoryList.toString());

    emit(GetShopMainCategoryData());
  }

}