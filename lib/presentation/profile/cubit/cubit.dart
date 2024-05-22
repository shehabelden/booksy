import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'state.dart';
class ProfileCubit extends Cubit<ProfileMainState> {
  ProfileCubit() : super(InitProfileState());
  static ProfileCubit get(context) => BlocProvider.of(context);
  Map <String,dynamic>  mapProfile={} ;
  List  myBookingList=[] ;
  List  myBookingManageList=[] ;
  List  myShopBookingIdList=[] ;
  List  myBookingIdList=[] ;
  String tranlet="en";
  String type="type";
  String ? getimage;
  String ? infoId;
  Map<String,dynamic>  myShop={};
  List myShopSer=[];
  Map <String,dynamic> aboutUs={};
  int i=0;
  int iBook=0;
  getProfile()async{
    emit(EmptyState());
    await FirebaseFirestore.instance.collection("Profile")
        .doc(FirebaseAuth.instance.currentUser!.uid).get().then((value){
      mapProfile=value.data()!;
    });
    emit(GetProfileState());
  }
  choseCubit(index){
    i=index;
    emit(ChoseState());
  }
  choseBookingCubit(index){
    iBook=index;
    print(iBook);
    emit(ChoseBookingState());
  }
  typeCubit(index)async{
    type=index;
    emit(TypeState());
  }
  statusCubit(status) async{
    emit(EmptyStatusState());
    await FirebaseFirestore.instance.collection("shope")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection(status).get().then((value){
      myShopSer= [];
      infoId=value.docs[0].id;
      value.docs.forEach((element) async{
        myShopSer.add(element.data());
      });
      print("this info id ${myShopSer}");
    });
    emit(GetStatusData());
  }
  shopCubit() async{
    emit(EmptyState());
    // shopList= [];
    await FirebaseFirestore.instance.collection("shope").
    doc(FirebaseAuth.instance.currentUser!.uid).get().
    then((value){
      myShop=value.data()!;
    });
    emit(GetShopData());
  }
  shopUpdateCubit(data) async{
    // shopList= [];
    await FirebaseFirestore.instance.collection("shope").
    doc(FirebaseAuth.instance.currentUser!.uid).update(data);
    emit(UpdateShopData());
  }

  addServices(data) async{
    // shopList= [];
    await FirebaseFirestore.instance.collection("shope").
    doc(FirebaseAuth.instance.currentUser!.uid).collection("Services").add(data);
    emit(AddServiceState());
  }
  addServDetails(data,id) async{
    // shopList= [];
    await FirebaseFirestore.instance.collection("shope").
    doc(FirebaseAuth.instance.currentUser!.uid).collection("Services").doc(id).update(data);
    emit(AddServiceState());
  }
  UpdateInfo(Map<String, dynamic> data) async{
    // shopList= [];
    await FirebaseFirestore.instance.collection("shope").
    doc(FirebaseAuth.instance.currentUser!.uid).collection("info").doc(infoId).update(data);
    emit(AddInfoState());
  }
  getBookingProfile()async{
    emit(EmptyBookingState());
   await FirebaseFirestore.instance.collection("Booking")
       .where("customer_id",isEqualTo: FirebaseAuth.instance.currentUser!.uid)
       .where("status",isEqualTo: "pending").get().then(
           (value){
             myBookingList=[];
             myShopBookingIdList= [];
             value.docs.forEach((element) {
               myShopBookingIdList.add(element.id);
               myBookingList.add(element.data());
          });
    });
    emit(GetMyBookingState());
  }
  updateBookingProfile(id,data)async{
    myBookingList=[];
    await FirebaseFirestore.instance.
    collection("Booking").doc(id).update(data);
    emit(UpdateMyBookingState());
  }

  trnsleteCubit(t)async{
    tranlet=t;
    emit(TranselateState());
  }
  addProfileImage()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
    );
    var formatter = new DateFormat('yyyy-MM-dd');
    var now = new DateTime.now();
    String formattedDate = formatter.format(now);
    if (result != null) {
      String fileName = result.files.first.path!;
      // Upload file
      final file=File(fileName);
      await FirebaseStorage.instance
          .ref('uploads/$formattedDate')
          .putFile(file);
      getimage = await FirebaseStorage.instance
          .ref('uploads/$formattedDate')
          .getDownloadURL();
      FirebaseFirestore.instance
          .collection("Profile")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        "image": getimage!,
      });
    }
    emit(AddImageProfile());
  }
  addShopImage()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    var formatter = new DateFormat('yyyy-MM-dd');
    var now = new DateTime.now();
    String formattedDate = formatter.format(now);
    if (result != null) {
      String fileName = result.files.first.path!;
      // Upload file
      final file=File(fileName);
      await FirebaseStorage.instance
          .ref('uploads/$formattedDate')
          .putFile(file);
      getimage = await FirebaseStorage.instance
          .ref('uploads/$formattedDate')
          .getDownloadURL();
      FirebaseFirestore.instance
          .collection("shope")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        "image": getimage!,
      });
    }
    emit(AddImageShopState());
  }
  addProtoImage()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    var formatter = new DateFormat('yyyy-MM-dd');
    var now = new DateTime.now();
    String formattedDate = formatter.format(now);
    if (result != null) {
      String fileName = result.files.first.path!;
      // Upload file
      final file=File(fileName);
      await FirebaseStorage.instance
          .ref('uploads/$formattedDate')
          .putFile(file);
      getimage = await FirebaseStorage.instance
          .ref('uploads/$formattedDate')
          .getDownloadURL();
      FirebaseFirestore.instance
          .collection("shope")
          .doc(FirebaseAuth.instance.currentUser!.uid).collection("protfolio")
          .add({
        "image": getimage!,
      });
    }
    emit(AddImageProtoState());
  }
  myBookingManageCubit() async{
    emit(EmptyStatusState());
    await FirebaseFirestore.instance.collection("shope")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Services").get().then((value){
      myBookingManageList= [];
      myBookingIdList=[];
      value.docs.forEach((element) async{
        myBookingManageList.add(element.data());
        myBookingIdList.add(element.id);
      });
    });
    emit(MyBookingManageState());
  }

}