import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Search extends StatelessWidget {
  const Search({super.key});
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Padding(
      padding:  EdgeInsets.only(left: width*.0277777777777778, right: width*.0277777777777778),
      child: Container(
        height: height *.065,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0),
            border: Border.all(
              color: Colors.grey.withOpacity(.6),
            ),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0,right: 20,left: 20),
              child: Icon(
                Icons.search,
                color: Colors.grey.shade400,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.find_best_vaccinate_treatment,
              style: GoogleFonts.manrope(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xffCACACA)),
            ),
          ],
        ),
      ),
    );
  }
}
