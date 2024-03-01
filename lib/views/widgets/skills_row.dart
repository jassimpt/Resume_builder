import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/model/resume_model.dart';

class SkillsInfoRow extends StatelessWidget {
  const SkillsInfoRow({
    super.key,
    required this.resume,
  });

  final ResumeModel resume;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Text(
                  "Skills :",
                  style: GoogleFonts.urbanist(
                    color: const Color.fromARGB(255, 59, 111, 255),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: resume.skills!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                String skills = resume.skills![index];
                return ListTile(
                  leading: Icon(
                    Icons.circle,
                    size: 15,
                  ),
                  title: Text(
                    skills,
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
