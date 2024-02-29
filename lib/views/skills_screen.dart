import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/views/summary_screen.dart';
import 'package:resume_builder/views/widgets/custom_textfield.dart';

class SkillsScreen extends StatelessWidget {
  SkillsScreen({super.key});

  TextEditingController skillsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SummaryScreen(),
              ));
        },
        backgroundColor: const Color.fromARGB(255, 59, 111, 255),
        child: const Icon(
          Icons.arrow_right,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Skills",
          style: GoogleFonts.urbanist(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actions: [
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          controller: skillsController,
                          hinttext: 'Skills',
                        ),
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {}, child: const Text('Submit')),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel')),
                          ],
                        )
                      ],
                    );
                  },
                );
              },
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor: const MaterialStatePropertyAll(
                      Color.fromARGB(255, 59, 111, 255))),
              child: const Text(
                "Add Skills",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
