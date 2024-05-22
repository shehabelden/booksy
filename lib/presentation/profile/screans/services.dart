import 'package:flutter/material.dart';
import '../cubit/cubit.dart';
import '../widget/add_service_button.dart';
import '../widget/my_shop_sevice.dart';
class ServicesProfileScreen extends StatelessWidget {
  const ServicesProfileScreen({super.key,required this.cubit});
  final ProfileCubit cubit;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 300.0,),
      child: SizedBox(
        height: .875*height,
        width: double.infinity,
        child: Stack(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: .125*height,left: .0416666666666667*width),
              child: SizedBox(
                width: double.infinity,
                height: height/2,
                child: ListView.builder(
                  itemCount: cubit.myShopSer.length,
                  itemBuilder: (context,i) {
                    return MyShopServicesContainer(
                      map: cubit.myShopSer[i],
                    );
                  }
                ),
              ),
            ),
            AddServiceButton(cubit:cubit),
          ],
        ),
      ),
    );
  }
}
