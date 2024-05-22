import 'package:flutter/widgets.dart';

import '../cubit/cubit.dart';
import '../widget/add_proto_image.dart';
import '../widget/body.dart';

class ProtoScreen extends StatelessWidget {
  const ProtoScreen({super.key,required this.cubit});
  final ProfileCubit cubit;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: .375*height,),
      child: Stack(
        children: [
          ProfileBody(cubit: cubit,),
          Padding(
            padding:  EdgeInsets.only(top: .4375*height,left: width*.0555555555555556),
            child: AddProtoImage(cubit: cubit),
          ),
        ],
      ),
    );
  }
}
