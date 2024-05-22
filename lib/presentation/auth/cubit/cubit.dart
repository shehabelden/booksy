import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class AuthCubit extends Cubit<AuthMainState> {
  AuthCubit() : super(AuthInitState());
  String  userType= "costmer";
  static AuthCubit get(context) => BlocProvider.of(context);
  userTypeCubit(value){
    userType=value;
    emit(UserTypeState());
  }
  signInCubit(emailAddress, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    emit(SignInState());
  }
  signUpCubit(emailAddress, password,name,userType) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    if(userType=="costmer"){
      createProf(FirebaseAuth.instance.currentUser!.uid,name);
    }else{
      createShop(FirebaseAuth.instance.currentUser!.uid,name);
    }
    emit(SignUpState());
  }
  createProf(uid,name)async{
   await FirebaseFirestore.instance.collection("Profile").doc(uid).set(
     {
       "name":name,
       "type":"costmer"
     }
   );
  }
  createShop(uid,name)async{
    await FirebaseFirestore.instance.collection("shope").doc(uid).set(
        {
          "name":name,
        }
    );
    FirebaseFirestore.instance.collection("shope").doc(uid).collection("commintes").add({});
  }

}
