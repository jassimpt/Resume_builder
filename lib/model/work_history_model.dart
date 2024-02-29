import 'package:hive/hive.dart';
part 'work_history_model.g.dart';

@HiveType(typeId: 4)
class WorkHistoryModel {
  @HiveField(0)
  String? employername;
  @HiveField(1)
  String? jobtitle;
  @HiveField(2)
  String? startdate;
  @HiveField(3)
  String? enddate;

  WorkHistoryModel(
      {required this.employername,
      required this.enddate,
      required this.jobtitle,
      required this.startdate});
}
