import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state.dart';
class SalonCubit extends Cubit<SalonManeState> {
  SalonCubit() : super(SalonInit());
  static SalonCubit get(context) => BlocProvider.of(context);
  int index=0;
  int indexBooking=0;
  double rate=0;
  Map <String,dynamic> shopMap={};
  List bookList=[];
  List shopList=[];
  List hourList=[];
  List minitList=[];
  DateTime date= DateTime.now();
  List idServicesList=[];
  Map <String,dynamic> bookingMap={};
  int time =0;
  Map mapProfile={};
  getMyRate(rating){
    rate=rating;
    emit(GetMyRateState());
  }
  chose(i){
    index=i;
    emit(ChoseState());
  }
  addMainRateCubit(id,allRate) async{
    await FirebaseFirestore.instance.collection("shope").doc(id).update({"rate":allRate});
    emit(AddRateState());
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
    // shopList= [];
    await FirebaseFirestore.instance.collection("shope").doc(id).collection(status).
    get().then((value){
      shopList=[];
      idServicesList=[];
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
      });
      print("this is book id: $sid");
      print("this is shop id: $id");
      // this is book id: BgT1ePGQJJbrKC0uA1nj
      // this is shop id: 4uSG6ZCbYUbCJIOZRPIs

      print(bookList);
    });
    emit(GetBookingData());
  }
  addBookingCubit(data) async{
    await FirebaseFirestore.instance.collection("Booking").add(data);
    emit(AddBookingData());
  }
  addDateCubit(data) {
    date=data;
    emit(AddDateData());
  }
  choseTime(i,hour){
    indexBooking=i;
    time=hour;
    emit(ChoseTimeState());
  }
  addCommintCubit(data,id,mainRate) async{
    await FirebaseFirestore.instance.collection("shope")
        .doc(id).collection("commintes").add(data);
    addMainRateCubit(id,mainRate);
    emit(AddCommintState());
  }
  getProfile()async{
    await FirebaseFirestore.instance.collection("Profile")
        .doc(FirebaseAuth.instance.currentUser!.uid).get().then((value){
      mapProfile=value.data()!;
    });
    emit(GetProfileState());
  }
  hoursList(map){
    Timestamp first=map["start_time"];
    Timestamp scound=map["end_time"];
    while(first.toDate().hour+2 < scound.toDate().hour+2){
      first=Timestamp(first.seconds+1800,0);
      hourList.add(first.toDate().hour);
      minitList.add(first.toDate().minute);
    }
    print("this is hours list line 104 ${first.seconds/3600}");
    emit(HourState());
  }
}