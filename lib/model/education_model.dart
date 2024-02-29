import 'package:hive/hive.dart';
part 'education_model.g.dart';

@HiveType(typeId: 3)
class EducationModel {
  @HiveField(0)
  String? schoolname;
  @HiveField(1)
  String? degree;
  @HiveField(2)
  String? startdate;
  @HiveField(3)
  String? enddate;

  EducationModel(
      {required this.degree,
      required this.enddate,
      required this.schoolname,
      required this.startdate});
}
