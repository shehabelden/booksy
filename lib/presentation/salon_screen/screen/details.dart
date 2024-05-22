import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Details extends StatelessWidget {
  const Details({super.key,required this.list,required this.about});
  final List ? list;
  final String ? about;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    List listDays=[AppLocalizations.of(context)!.monday,
      AppLocalizations.of(context)!.tuesday,
      AppLocalizations.of(context)!.wednesday,
      AppLocalizations.of(context)!.thursday,
      AppLocalizations.of(context)!.friday,
      AppLocalizations.of(context)!.saturday,
      AppLocalizations.of(context)!.sunday
    ];
    return SingleChildScrollView(
      child: Container(
        height:height ,
        padding:const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.about_us,style:const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            )),
            const SizedBox(height: 10),
            SizedBox(
                width: width*1.111111111111111,
                height: height/4,
                child: Text(about!),
            ),
             Text(AppLocalizations.of(context)!.contact,style:const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
            )),
            const Divider(thickness: 1.1),
            Row(
              children: [
                Text(list![0]["phone"],style:const TextStyle(
                  fontSize: 20,
                  color: Colors.grey
                ),),
              ],
            ),
            const Divider(thickness: 1.1),
            ListView.builder(
              physics:const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemCount:listDays.length ,
                itemBuilder: (context,i){
              return Row(
                children: [
                  Expanded(flex: 1,child: Container(
                    child: Text(listDays[i],style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey
                    ),),
                  )),
                  Expanded(flex: 1,child: Container(
                    child: Text(list![0]["time"][i] == "" ? "close"  :"${list![0]["time"][i]}"  ,style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),),
                  )),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
