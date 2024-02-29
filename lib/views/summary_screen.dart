import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder/controller/data_controller.dart';
import 'package:resume_builder/model/education_model.dart';
import 'package:resume_builder/model/personal_details_model.dart';
import 'package:resume_builder/model/resume_model.dart';
import 'package:resume_builder/model/work_history_model.dart';
import 'package:resume_builder/views/home_screen.dart';

class SummaryScreen extends StatelessWidget {
  SummaryScreen(
      {super.key,
      required this.education,
      required this.personaldetails,
      required this.skills,
      required this.workhistory});

  final PersonalDetailsModel personaldetails;
  final List<WorkHistoryModel> workhistory;
  final List<EducationModel> education;
  final List<String> skills;

  TextEditingController summaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Summary",
          style: GoogleFonts.urbanist(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: summaryController,
              decoration: const InputDecoration(
                hintText: 'Enter your summary',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(
                onPressed: () {
                  saveResume(context);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                      (route) => false);
                },
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor: const MaterialStatePropertyAll(
                        Color.fromARGB(255, 59, 111, 255))),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void saveResume(BuildContext context) {
    final pro = Provider.of<DataController>(context, listen: false);
    ResumeModel resume = ResumeModel(
      education: education,
      summary: summaryController.text.trim(),
      skills: skills,
      personaldetails: personaldetails,
      workhistory: workhistory,
    );
    pro.addResume(resume);
  }
}
