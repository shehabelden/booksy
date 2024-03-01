import 'package:booksy/presentation/document/cubit/cubit.dart';
import 'package:booksy/presentation/document/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'document_screen.dart';
import 'widget/document_header.dart';
import 'widget/document_list_continer.dart';

class DocumentList extends StatelessWidget {
  const DocumentList({super.key,required this.category});
  final String ? category;
  @override
  Widget build(BuildContext context) {
    MainDocCubit cubit=MainDocCubit.get(context);
    cubit.allDocs(category);
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return BlocBuilder<MainDocCubit,MainDocState>(
      builder: (context,state) {
        return state is EmptyState ? const Center(child: CircularProgressIndicator(),) :  Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: const Center(
                child: Text(
              "booksy",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            title:  Padding(
                padding: EdgeInsets.only(left:
                width*.6944444444444444), child:const Icon(Icons.search)),
          ),
          backgroundColor: Colors.grey.shade100,
          body: Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: SingleChildScrollView(
                child: Column(
              children: [
                 DocumentHeader(name: cubit.docMap["category"],),
                Padding(
                  padding:  EdgeInsets.only(top: height*.125),
                  child: Container(
                    constraints:  BoxConstraints(
                      minHeight: height*.75,
                      maxHeight: ((height*.75) * cubit.docList.length) + 20,
                    ),
                    padding:  EdgeInsets.only(left: width*.0555555555555556, right: width*.0555555555555556),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cubit.docList.length,
                        itemBuilder: (c, i) {
                          return  InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>  DocumentScreen(topicId: cubit.idList[i],id:cubit.id),
                                  ));
                            },
                              child: DocumentListContainer(map: cubit.docList[i],)
                          );
                        }),
                  ),
                ),
              ],
            )),
          ),
        );
      }
    );
  }
}
