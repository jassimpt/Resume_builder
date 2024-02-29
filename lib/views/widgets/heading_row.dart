import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingRow extends StatelessWidget {
  const HeadingRow({super.key, required this.text1, required this.text2});

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1,
          style: GoogleFonts.urbanist(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 59, 111, 255),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text2,
          style: GoogleFonts.urbanist(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
