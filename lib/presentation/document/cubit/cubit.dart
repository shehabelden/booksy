import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';
class MainDocCubit extends Cubit<MainDocState> {
  MainDocCubit() : super(InitDocState());

  static MainDocCubit get(context) => BlocProvider.of(context);
  List docList=[];
  List topicList=[];
  List idList=[];
  Map docMap={};
  String id="";
  allDocs(category){
    emit(EmptyState());
    FirebaseFirestore.instance.collection("documents").where("category",isEqualTo: category).get().then((value){
      // print(value);
        docMap={};
        docMap=value.docs.last.data();
        id=value.docs.last.id;
        doc(value.docs.last.id);
    });
    emit(AllDocsState());

  }
  doc(id)async{
    emit(EmptyState());
    if(id!=null){
    await FirebaseFirestore.instance.collection("documents").
    doc(id).collection("document").get().then((value){
      docList=[];
      idList=[];
      value.docs.forEach((element) {
        print(element.data());
        docList.add(element.data());
        idList.add(element.id);
      });
    });}
    emit(DocState());

  }
  docInfo(id,topicId) async{
    emit(EmptyState());
   await  FirebaseFirestore.instance.collection("documents").
    doc(id).collection("document").doc(topicId).collection("topic").get().then((value){
     // topicList=[];
      value.docs.forEach((element){
        print(element.data());
        topicList.add(element.data());
        topicList.add(element.id);
      });

    });
    emit(DocInfoState());
  }

}