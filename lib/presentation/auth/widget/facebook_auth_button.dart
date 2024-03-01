import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FaceBookAuthLoginButton extends StatelessWidget {
  const FaceBookAuthLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Container(
      height: height* .0625,
      width: width*.7222222222222222,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue[900],
        // border: Border.all(color: Colors.black, width: 1),
      ),
      child: Row(
        children: [
           SizedBox(
            width: width *.0125,
          ),
          Container(
            height: height *.05,
            width:  height *.05,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/facebook_logo.png"),
                    fit: BoxFit.cover)),
          ),
           SizedBox(
            width: width* .10,
          ),
           Text(AppLocalizations.of(context)!.continue_with_Facebook,
              style:const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
