import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state.dart';
class ProfileCubit extends Cubit<ProfileMainState> {
  ProfileCubit() : super(InitProfileState());
  static ProfileCubit get(context) => BlocProvider.of(context);
  Map <String,dynamic>  mapProfile={} ;
  List  myBookingList=[] ;
  String tranlet="en";
  getProfile()async{
    emit(EmptyState());
    await FirebaseFirestore.instance.collection("Profile")
        .doc(FirebaseAuth.instance.currentUser!.uid).get().then((value){
      mapProfile=value.data()!;
    });
    emit(GetProfileState());
  }
  getBookingProfile()async{
    emit(EmptyBookingState());
   await FirebaseFirestore.instance.collection("Profile")
        .doc(FirebaseAuth.instance.currentUser!.uid).collection("Booking").get().then((value){
     myBookingList=[];
          value.docs.forEach((element) {
            myBookingList.add(element.data());
          });
    });
    emit(GetMyBookingState());
  }
  trnsleteCubit(t)async{
    tranlet=t;
    emit(TranselateState());
  }

}