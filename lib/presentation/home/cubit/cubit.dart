import 'package:booksy/presentation/home/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/cash_helper/cash_helper.dart';
import '../../auth/login_check.dart';
import '../../book/my_book.dart';
import 'state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(InitState());
  static MainCubit get(context) => BlocProvider.of(context);
  List categoryList=[];
  List idList=[];
  List shopList=[];
  String lang="";
  List searchList=[];
  List listCont= const[
    HomeScreen(),
    MyBooking(),
    LoginCheck(),
  ];
   int count=0;
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
  shopCubit()async{
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
