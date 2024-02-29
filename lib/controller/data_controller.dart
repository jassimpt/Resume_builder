import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:resume_builder/model/education_model.dart';
import 'package:resume_builder/model/resume_model.dart';
import 'package:resume_builder/model/work_history_model.dart';

class DataController extends ChangeNotifier {
  List<EducationModel> educationlist = [];
  List<WorkHistoryModel> workhistorylist = [];
  List<ResumeModel> resumelist = [];
  List<String> skillslist = [];

  void addEducation(EducationModel education) {
    educationlist.add(education);
    notifyListeners();
  }

  void addWorkHistory(WorkHistoryModel workhistory) {
    workhistorylist.add(workhistory);
    notifyListeners();
  }

  void addSkills(String skill) {
    skillslist.add(skill);
    notifyListeners();
  }

  void addResume(ResumeModel resume) async {
    final resumeBox = await Hive.openBox<ResumeModel>("resumes");
    resumeBox.add(resume);
    resumelist.add(resume);
    notifyListeners();
  }

  void getAllResume() async {
    final resumeBox = await Hive.openBox<ResumeModel>("resumes");
    resumelist.clear();
    resumelist = resumeBox.values.toList();
    notifyListeners();
  }

  void deleteCv(int index) async {
    final resumeBox = await Hive.openBox<ResumeModel>("resumes");
    resumelist.removeAt(index);
    resumeBox.deleteAt(index);
    notifyListeners();
  }

  void clearBox() async {
    final resumeBox = await Hive.openBox<ResumeModel>("resumes");
    resumeBox.clear();
  }
}
