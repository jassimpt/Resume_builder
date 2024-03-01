import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/model/education_model.dart';
import 'package:resume_builder/model/resume_model.dart';
import 'package:resume_builder/model/work_history_model.dart';
import 'package:resume_builder/views/widgets/education_info.dart';
import 'package:resume_builder/views/widgets/personal_info_row.dart';
import 'package:resume_builder/views/widgets/skills_row.dart';
import 'package:resume_builder/views/widgets/summary_row.dart';
import 'package:resume_builder/views/widgets/work_info_row.dart';

class ResumeScreen extends StatelessWidget {
  ResumeScreen({super.key, required this.resume});

  ResumeModel resume;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Resume",
          style: GoogleFonts.urbanist(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 59, 111, 255),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${resume.personaldetails!.firstname} ${resume.personaldetails!.lastname}",
                style: GoogleFonts.urbanist(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
              child: Text(
                resume.personaldetails!.profession!,
                style: GoogleFonts.urbanist(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                  child: Text(
                    "Phone :",
                    style: GoogleFonts.urbanist(
                      color: const Color.fromARGB(255, 59, 111, 255),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                  child: Text(
                    resume.personaldetails!.phone!,
                    style: GoogleFonts.urbanist(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                  child: Text(
                    "Email :",
                    style: GoogleFonts.urbanist(
                      color: const Color.fromARGB(255, 59, 111, 255),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                  child: Text(
                    resume.personaldetails!.email!,
                    style: GoogleFonts.urbanist(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Color.fromARGB(255, 59, 111, 255),
            ),
            SummaryRow(resume: resume),
            const Divider(
              color: Color.fromARGB(255, 59, 111, 255),
            ),
            PersonalInfoRow(resume: resume),
            const Divider(
              color: Color.fromARGB(255, 59, 111, 255),
            ),
            EducationInfoRow(
              resume: resume,
            ),
            const Divider(
              color: Color.fromARGB(255, 59, 111, 255),
            ),
            WorkInfoRow(resume: resume),
            const Divider(
              color: Color.fromARGB(255, 59, 111, 255),
            ),
            SkillsInfoRow(resume: resume)
          ],
        ),
      ),
    );
  }
}
