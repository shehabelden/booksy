import 'package:booksy/presentation/profile/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../utils/theme/controllers/controllers.dart';
class AboutAsMyShop extends StatelessWidget {
  const AboutAsMyShop({super.key, required this.cubit, required this.about});
  final ProfileCubit cubit;
  final String? about;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List listDays = [
      AppLocalizations.of(context)!.monday,
      AppLocalizations.of(context)!.tuesday,
      AppLocalizations.of(context)!.wednesday,
      AppLocalizations.of(context)!.thursday,
      AppLocalizations.of(context)!.friday,
      AppLocalizations.of(context)!.saturday,
      AppLocalizations.of(context)!.sunday
    ];
    return Padding(
      padding:  EdgeInsets.only(top:height/2 ,),
      child: Stack(
        children: [
          Container(
            padding:  EdgeInsets.only(left: .0555555555555556 *width, right: .0555555555555556 *width),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.about_us,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                SizedBox(
                  width: width * 1.111111111111111,
                  child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text(
                                      cubit.myShopSer[0]["about_us"] == null
                                          ? "add about As"
                                          : "update about us"),
                                  actions: [
                                    Column(
                                      children: [
                                        TextField(
                                          maxLines: 2,
                                          decoration: const InputDecoration(
                                              label: Text("About us")),
                                          controller: Controllers.name,
                                        ),
                                         SizedBox(
                                          height: 0.025*height,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            cubit.UpdateInfo({
                                              "about_us": Controllers.name.text,
                                            });
                                          },
                                          child: Container(
                                            width: .2777777777777778*width,
                                            height: 0.05*height,
                                            decoration: BoxDecoration(
                                                color: Color(0xFF43def0),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "add about us",
                                              style:
                                                  TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ));
                      },
                      child: Text(cubit.myShopSer[0]["about_us"] == null
                          ? "please add about us"
                          : cubit.myShopSer[0]["about_us"])),
                ),
                Text(AppLocalizations.of(context)!.contact,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
                const Divider(thickness: 1.1),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text(cubit.myShopSer[0]["phone"] == null
                                  ? "add phone"
                                  : "update phone"),
                              actions: [
                                Column(
                                  children: [
                                    TextField(
                                      maxLines: 2,
                                      decoration: const InputDecoration(
                                          label: Text("phone")),
                                      controller: Controllers.name,
                                    ),
                                     SizedBox(
                                      height: height*0.025,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        cubit.UpdateInfo({
                                          "phone": Controllers.name.text,
                                        });
                                      },
                                      child: Container(
                                        width: width*0.2777777777777778,
                                        height: .05*height,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF43def0),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "add phone",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ));
                  },
                  child: Text(
                    cubit.myShopSer[0]["phone"] == null
                        ? "please add phone number"
                        : cubit.myShopSer[0]["phone"],
                    style: const TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
                const Divider(thickness: 1.1),
                cubit.myShopSer[0]["time"] == null
                    ? InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => SingleChildScrollView(
                                child: AlertDialog(
                                  title: Text(
                                      cubit.myShopSer[0]["about_us"] == null
                                          ? "add about As"
                                          : "update about us"),
                                  actions: [
                                    Column(
                                      children: [
                                        TextField(
                                          maxLines: 2,
                                          decoration: InputDecoration(
                                              label: Text(listDays[0])),
                                          controller: Controllers.monday,
                                        ),
                                        TextField(
                                          maxLines: 2,
                                          decoration:  InputDecoration(
                                              label: Text(listDays[1])),
                                          controller: Controllers.tuesday,
                                        ),
                                        TextField(
                                          maxLines: 2,
                                          decoration:  InputDecoration(
                                              label: Text(listDays[2])),
                                          controller: Controllers.wednesday,
                                        ),
                                        TextField(
                                          maxLines: 2,
                                          decoration:  InputDecoration(
                                              label: Text(listDays[3])),
                                          controller: Controllers.thursday,
                                        ),
                                        TextField(
                                          maxLines: 2,
                                          decoration:  InputDecoration(
                                              label: Text(listDays[4])),
                                          controller: Controllers.friday,
                                        ),
                                        TextField(
                                          maxLines: 2,
                                          decoration:  InputDecoration(
                                              label: Text(listDays[5])),
                                          controller: Controllers.saturday,
                                        ),
                                        TextField(
                                          maxLines: 2,
                                          decoration:  InputDecoration(
                                              label: Text(listDays[6])),
                                          controller: Controllers.sunday,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            cubit.UpdateInfo({
                                              "time": [
                                                Controllers.monday.text,
                                                Controllers.tuesday.text,
                                                Controllers.wednesday.text,
                                                Controllers.thursday.text,
                                                Controllers.friday.text,
                                                Controllers.saturday.text,
                                                Controllers.sunday.text,
                                              ],
                                            });
                                          },
                                          child: Container(
                                            width: .2777777777777778*width,
                                            height: .05*height,
                                            decoration: BoxDecoration(
                                                color: Color(0xFF43def0),
                                                borderRadius:
                                                BorderRadius.circular(12)),
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "add about us",
                                              style:
                                              TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ));
                        },
                        child: const Text("please add bussnes time"))
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: listDays.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      child: Text(
                                        listDays[i],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.grey),
                                      ),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Text(
                                        cubit.myShopSer[0]["time"][i] == ""
                                            ? "close"
                                            : "${cubit.myShopSer[0]["time"][i]}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    )),
                              ],
                            ),
                          );
                        }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
