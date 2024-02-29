import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:resume_builder/views/skills_screen.dart';
import 'package:resume_builder/views/widgets/custom_textfield.dart';
import 'package:resume_builder/views/widgets/heading_row.dart';

class EducationScreen extends StatelessWidget {
  EducationScreen({super.key});

  TextEditingController scahoolnameController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController degreecontroller = TextEditingController();

  Future<void> selectMonthYear(
      BuildContext context, TextEditingController controller) async {
    DateTime currentDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
      initialDatePickerMode: DatePickerMode.year,
    );

    if (selectedDate != null) {
      String formateddate = DateFormat("MMM/yyy").format(selectedDate);

      controller.text = formateddate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SkillsScreen(),
              ));
        },
        backgroundColor: Color.fromARGB(255, 59, 111, 255),
        child: const Icon(
          Icons.arrow_right,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Education",
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
                          controller: scahoolnameController,
                          hinttext: 'Schoolname',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: degreecontroller,
                          hinttext: 'Degree',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () =>
                              selectMonthYear(context, startDateController),
                          child: AbsorbPointer(
                            child: CustomTextField(
                              controller: startDateController,
                              hinttext: 'Start Date',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () =>
                              selectMonthYear(context, endDateController),
                          child: AbsorbPointer(
                            child: CustomTextField(
                              controller: endDateController,
                              hinttext: 'Start Date',
                            ),
                          ),
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
                "Add work",
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
