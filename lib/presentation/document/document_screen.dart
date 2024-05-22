import 'package:booksy/presentation/document/cubit/cubit.dart';
import 'package:booksy/presentation/document/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key,required this.id,required this.topicId});
  final String ? topicId;
  final String ? id;
  @override
  Widget build(BuildContext context) {
    MainDocCubit cubit=MainDocCubit.get(context);
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    cubit.docInfo(id, topicId);
    return BlocBuilder<MainDocCubit,MainDocState>(
      builder: (context,state) {
        return cubit.topicList.isEmpty || state is EmptyState  ? const Center(child: CircularProgressIndicator(),) : Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: const Center(
                child: Text(
              "booksy",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            title:  Padding(
                padding: EdgeInsets.only(left: width*.6944444444444444),
                child: Icon(Icons.search)),
          ),
          backgroundColor: Colors.grey.shade100,
          body: Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics:const NeverScrollableScrollPhysics(),
              itemCount: cubit.topicList.length,
              itemBuilder: (c,i){
                return Container(
                  color: Colors.white,
                  padding:  EdgeInsets.only(right: width*.0555555555555556, left: width*.0555555555555556),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(cubit.topicList[i]["head"],
                          style:const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                      const Row(
                        children: [
                          Text("septmber 12/1/2024"),
                          Text(".reding time :6"),
                        ],
                      ),
                       SizedBox(height:height*.0277777777777778 ),
                      Container(
                        width: width*.9722222222222222,
                        height: height*.25,
                        decoration:  BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(cubit.topicList[i]["image"]),
                              fit: BoxFit.cover),
                        ),
                      ),
                       SizedBox(
                        width: width*.9722222222222222,
                        height: height,
                        child: Text(cubit.topicList[i]["topic"]),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      }
    );
  }
}
