import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class SalonCubit extends Cubit<SalonManeState> {
  SalonCubit() : super(SalonInit());
  static SalonCubit get(context) => BlocProvider.of(context);
  int index=0;
  int indexBooking=0;

  Map <String,dynamic> shopMap={};
  List bookList=[];
  List shopList=[];
  DateTime date= DateTime.now();
  List idServicesList=[];
  Map <String,dynamic> bookingMap={};
  String time ="";
  chose(i){
    index=i;
    emit(ChoseState());
  }
  shopCubit(id) async{
      emit(EmptyState());
      await FirebaseFirestore.instance.collection("shope").doc(id).get().then((value){
        shopMap=value.data()!;
        // print(shopMap);
      });
      emit(GetShopData());
    }
  statusCubit(id,status) async{
    emit(EmptyStatusState());
    shopList= [];
    await FirebaseFirestore.instance.collection("shope").doc(id).collection(status).get().then((value){
     value.docs.forEach((element) async{
       shopList.add(element.data());
       idServicesList.add(element.id);
     });
      print(shopList);
    });
    emit(GetStatusData());
  }
  bookingCubit(id,sid) async{
    emit(EmptyStatusState());
    await FirebaseFirestore.instance.collection("shope")
        .doc(id).collection("Services").doc(sid).collection("booking").get()
        .then((value){
      bookList= [];
      value.docs.forEach((element) async{
        bookList.add(element.data());
        idServicesList.add(element.id);
      });
      print(bookList);
    });
    emit(GetBookingData());
  }
  addBookingCubit(data) async{
    await FirebaseFirestore.instance.collection("Profile")
        .doc(FirebaseAuth.instance.currentUser!.uid).collection("Booking").add(data);
    emit(AddBookingData());
  }
  addDateCubit(dat) {
    date=dat;
    emit(AddDateData());
  }
  choseTime(i,chose){
    indexBooking=i;
    time=chose;
    emit(ChoseTimeState());
  }

}
