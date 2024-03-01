import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder/controller/data_controller.dart';
import 'package:resume_builder/model/personal_details_model.dart';
import 'package:resume_builder/model/work_history_model.dart';
import 'package:resume_builder/views/education_screen.dart';
import 'package:resume_builder/views/widgets/custom_textfield.dart';
import 'package:resume_builder/views/widgets/heading_row.dart';

class WorkHistoryScreen extends StatelessWidget {
  WorkHistoryScreen({super.key, required this.personalDetails});

  final PersonalDetailsModel personalDetails;

  TextEditingController employerController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController jobtitlecontroller = TextEditingController();

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
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EducationScreen(
              personalDetails: personalDetails,
              workHistory: pro.workhistorylist,
            ),
          ));
        },
        backgroundColor: const Color.fromARGB(255, 59, 111, 255),
        child: const Icon(
          Icons.arrow_right,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const HeadingRow(text1: "Work", text2: "History"),
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
                          controller: employerController,
                          hinttext: 'Employer',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: jobtitlecontroller,
                          hinttext: 'Jobtitle',
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
                                  addWorkHistory(context);
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
                    itemCount: datacontroller.workhistorylist.length,
                    itemBuilder: (context, index) {
                      final WorkHistoryModel work =
                          datacontroller.workhistorylist[index];
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
                                        work.jobtitle!,
                                        style: GoogleFonts.urbanist(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        work.employername!,
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
                                      work.startdate!,
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
                                      work.enddate!,
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
            ),
          ],
        ),
      ),
    );
  }

  void addWorkHistory(BuildContext context) {
    final pro = Provider.of<DataController>(context, listen: false);

    WorkHistoryModel workhistory = WorkHistoryModel(
        employername: employerController.text,
        enddate: startDateController.text,
        jobtitle: jobtitlecontroller.text,
        startdate: startDateController.text);
    pro.addWorkHistory(workhistory);
    Navigator.pop(context);
  }
}
