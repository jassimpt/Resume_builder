import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder/controller/data_controller.dart';
import 'package:resume_builder/model/education_model.dart';
import 'package:resume_builder/model/personal_details_model.dart';
import 'package:resume_builder/model/work_history_model.dart';
import 'package:resume_builder/views/summary_screen.dart';
import 'package:resume_builder/views/widgets/custom_textfield.dart';

class SkillsScreen extends StatelessWidget {
  SkillsScreen(
      {super.key,
      required this.education,
      required this.personaldetails,
      required this.workhistory});

  final PersonalDetailsModel personaldetails;
  final List<WorkHistoryModel> workhistory;
  final List<EducationModel> education;

  TextEditingController skillsController = TextEditingController();

  final List<String> skills = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final pro = Provider.of<DataController>(context, listen: false);

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SummaryScreen(
                  education: education,
                  personaldetails: personaldetails,
                  skills: pro.skillslist,
                  workhistory: workhistory,
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
                                onPressed: () {
                                  addSkill(context);
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
                "Add Skills",
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
                  itemCount: datacontroller.skillslist.length,
                  itemBuilder: (context, index) {
                    final String skill = datacontroller.skillslist[index];
                    return ListTile(
                      title: Text(
                        skill,
                        style: GoogleFonts.urbanist(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ));
              },
            )
          ],
        ),
      ),
    );
  }

  void addSkill(BuildContext context) {
    final pro = Provider.of<DataController>(context, listen: false);
    pro.addSkills(skillsController.text);
    Navigator.pop(context);
  }
}
