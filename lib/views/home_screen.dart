import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/views/personal_details.dart';
import 'package:resume_builder/views/widgets/heading_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadingRow(text1: "Resume", text2: "builder"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonalDetails(),
                ));
          },
          backgroundColor: const Color.fromARGB(255, 59, 111, 255),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
