import 'package:hive/hive.dart';
import 'package:resume_builder/model/education_model.dart';
import 'package:resume_builder/model/work_history_model.dart';

@HiveType(typeId: 1)
class ResumeModel {
  @HiveField(0)
  String? firstname;
  @HiveField(1)
  String? lastname;
  @HiveField(2)
  String? profession;
  @HiveField(3)
  String? gender;
  @HiveField(4)
  String? phone;
  @HiveField(5)
  String? dob;
  @HiveField(6)
  String? nationality;
  @HiveField(7)
  String? email;
  @HiveField(8)
  EducationModel? education;
  @HiveField(9)
  WorkHistoryModel? workhistory;

  ResumeModel(
      {required this.dob,
      required this.education,
      required this.email,
      required this.firstname,
      required this.gender,
      required this.lastname,
      required this.nationality,
      required this.phone,
      required this.profession,
      required this.workhistory});
}
