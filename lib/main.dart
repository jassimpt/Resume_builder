import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder/controller/data_controller.dart';
import 'package:resume_builder/model/education_model.dart';
import 'package:resume_builder/model/personal_details_model.dart';
import 'package:resume_builder/model/resume_model.dart';
import 'package:resume_builder/model/work_history_model.dart';
import 'package:resume_builder/views/home_screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(ResumeModelAdapter().typeId) &&
      !Hive.isAdapterRegistered(PersonalDetailsModelAdapter().typeId) &&
      !Hive.isAdapterRegistered(WorkHistoryModelAdapter().typeId) &&
      !Hive.isAdapterRegistered(EducationModelAdapter().typeId)) {
    Hive.registerAdapter(ResumeModelAdapter());
    Hive.registerAdapter(PersonalDetailsModelAdapter());
    Hive.registerAdapter(EducationModelAdapter());
    Hive.registerAdapter(WorkHistoryModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataController(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
