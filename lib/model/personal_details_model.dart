import 'package:hive/hive.dart';
part 'personal_details_model.g.dart';

@HiveType(typeId: 2)
class PersonalDetailsModel {
  @HiveField(0)
  String? firstname;
  @HiveField(1)
  String? lastname;
  @HiveField(2)
  String? phone;
  @HiveField(3)
  String? profession;
  @HiveField(4)
  String? gender;
  @HiveField(5)
  String? dob;
  @HiveField(6)
  String? nationality;
  @HiveField(7)
  String? email;
  @HiveField(8)
  PersonalDetailsModel(
      {required this.dob,
      required this.phone,
      required this.email,
      required this.firstname,
      required this.gender,
      required this.lastname,
      required this.nationality,
      required this.profession});
}
