import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder/controller/data_controller.dart';
import 'package:resume_builder/model/education_model.dart';
import 'package:resume_builder/model/personal_details_model.dart';
import 'package:resume_builder/model/work_history_model.dart';
import 'package:resume_builder/views/skills_screen.dart';
import 'package:resume_builder/views/widgets/custom_textfield.dart';

class EducationScreen extends StatelessWidget {
  EducationScreen(
      {super.key, required this.workHistory, required this.personalDetails});

  final List<WorkHistoryModel> workHistory;
  final PersonalDetailsModel personalDetails;

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
          final pro = Provider.of<DataController>(context, listen: false);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SkillsScreen(
                  personaldetails: personalDetails,
                  workhistory: workHistory,
                  education: pro.educationlist,
                ),
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
                                onPressed: () {
                                  addEducation(context);
                                },
                                child: const Text('Submit')),
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
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Consumer<DataController>(
              builder: (context, datacontroller, child) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: datacontroller.educationlist.length,
                    itemBuilder: (context, index) {
                      final EducationModel education =
                          datacontroller.educationlist[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 219, 219, 219)),
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        education.degree!,
                                        style: GoogleFonts.urbanist(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        education.schoolname!,
                                        style: GoogleFonts.urbanist(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      education.startdate!,
                                      style: GoogleFonts.urbanist(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "to",
                                      style: GoogleFonts.urbanist(
                                        color: const Color.fromARGB(
                                            255, 59, 111, 255),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      education.enddate!,
                                      style: GoogleFonts.urbanist(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void addEducation(BuildContext context) {
    final pro = Provider.of<DataController>(context, listen: false);
    EducationModel education = EducationModel(
        degree: degreecontroller.text,
        enddate: endDateController.text,
        schoolname: scahoolnameController.text,
        startdate: startDateController.text);
    pro.addEducation(education);
    Navigator.pop(context);
  }
}
