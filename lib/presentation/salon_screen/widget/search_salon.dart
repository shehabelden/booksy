import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchSalon extends StatelessWidget {
  const SearchSalon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Container(
        height: 52,
        width: 600,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            border: Border.all(
              color: Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0,left: 20),
              child: Icon(
                Icons.search,
                color: Colors.grey.shade400,
              ),
            ),
            Text(
              "Search for Service",
              style: GoogleFonts.manrope(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color:  Colors.grey.shade400),
            ),
          ],
        ),
      ),
    );
  }
}
