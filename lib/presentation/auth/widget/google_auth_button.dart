import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class GoogleAuthLoginButton extends StatelessWidget {
  const GoogleAuthLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 260,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF252525),
        // border: Border.all(color: Colors.black, width: 1),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/gogolelogo.png"),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 30,
          ),
           Text(AppLocalizations.of(context)!.continue_with_google,
              style:const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
