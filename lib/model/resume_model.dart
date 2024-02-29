import 'package:hive/hive.dart';
import 'package:resume_builder/model/education_model.dart';
import 'package:resume_builder/model/personal_details_model.dart';
import 'package:resume_builder/model/work_history_model.dart';
part 'resume_model.g.dart';

@HiveType(typeId: 1)
class ResumeModel {
  @HiveField(0)
  PersonalDetailsModel? personaldetails;
  @HiveField(1)
  List<EducationModel>? education;
  @HiveField(2)
  List<WorkHistoryModel>? workhistory;
  @HiveField(3)
  List<String>? skills;
  @HiveField(4)
  String? summary;

  ResumeModel(
      {required this.education,
      required this.summary,
      required this.skills,
      required this.personaldetails,
      required this.workhistory});
}
