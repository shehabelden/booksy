import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/cash_helper/cash_helper.dart';
import '../../auth/login_check.dart';
import '../../book/check_my_booking.dart';
import '../home_screen.dart';
import 'state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(InitState());
  static MainCubit get(context) => BlocProvider.of(context);
  List categoryList=[];
  List shopCategoryList=[];
  List shopMainList=[];
  List idList=[];
  List idCategoryList=[];
  List shopList=[];
  String lang="";
  List searchList=[];
  List rateList=[];
  List rate=[];
  int rateCont=0;
  List listCont= const[
    HomeScreen(),
    CheckBookingScreen(),
    LoginCheck(),
  ];
   int count=0;
  shopMainCubit()async{
    emit(EmptyState());
    await FirebaseFirestore.instance.collection("shop_category").get().then((value){
      shopMainList=[];
      value.docs.forEach((element) {
        // print(element.data());
        shopMainList.add(element.data());
      });
    });
    emit(GetShopMainCategoryData());
  }


  trnsleteCubit(t)async{
   await CacheHelper.removeData(key: "lang");
   CacheHelper.put(key: "lang", value: t);
    emit(TranselateState());
  }
  docList()async{
    emit(EmptyState());
   await FirebaseFirestore.instance.collection("category").get().then((value){
     categoryList=[];
     value.docs.forEach((element) {
        // print(element.data());
        categoryList.add(element.data());
      });
    });
    emit(GetDocData());
  }
  getRateCubit(id) async{
    await FirebaseFirestore.instance.collection("shope")
        .doc(id).collection("commintes").get().then((value) {
       rateList=[];
          value.docs.forEach((element) {
            rateList.add(element.data());
          });
          print("this is rate $id ${rateList.length}");
    });
    emit(GetRateState());
  }

  shopCubit()async{
    emit(EmptyState());
    await FirebaseFirestore.instance.collection("shope").where("pending",isEqualTo: "accepted").get().then((value){
      shopList=[];
      idList=[];
      value.docs.forEach((element) {
        // print(element.data());
        if(element.data()["pending"]=="accepted"){
        idList.add(element.id);
        shopList.add(element.data());}
      });
    });
    print(shopList.toString());

    emit(GetShopData());
  }
  HomeCubit()async{
    emit(EmptyState());
    await FirebaseFirestore.instance.collection("shope").get().then((value){
      shopList=[];
      idList=[];
      value.docs.forEach((element) {
        // print(element.data());
        idList.add(element.id);
        shopList.add(element.data());
      });
    });
    print(shopList.toString());

    emit(GetShopData());
  }

  countCubit(index){
    count=index;
    emit(CountState());
  }
  localCubit(lan){
    lang=lan;
    emit(LocaleState());
  }
  // cubit.searchCubit("e");
  searchCubit(search)async{
    emit(EmptyState());
    if(search==""){
      searchList=[];
    }else{
    await FirebaseFirestore.instance.collection("shope")
        .orderBy("name").startAt([search]).endAt([search + "\uf8ff"]).get().then((value) {
      searchList=[];
      value.docs.forEach((element) {
        searchList.add(element.data()["name"]);
      });
    });}
    print(searchList.toString());

    emit(GetShopData());
  }

}
