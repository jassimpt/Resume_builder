import 'package:flutter/material.dart';
import 'package:resume_builder/model/personal_details_model.dart';
import 'package:resume_builder/views/widgets/custom_textfield.dart';
import 'package:resume_builder/views/widgets/heading_row.dart';
import 'package:resume_builder/views/work_history_screen.dart';

class PersonalDetails extends StatelessWidget {
  PersonalDetails({super.key});

  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController professioncontroller = TextEditingController();
  TextEditingController gendercontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController Dobcontroller = TextEditingController();
  TextEditingController Nationalitycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 59, 111, 255),
        onPressed: () {
          PersonalDetailsModel personalDetails = PersonalDetailsModel(
              dob: Dobcontroller.text,
              phone: phonecontroller.text,
              email: emailcontroller.text,
              firstname: firstnamecontroller.text,
              gender: gendercontroller.text,
              lastname: lastnamecontroller.text,
              nationality: Nationalitycontroller.text,
              profession: professioncontroller.text);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WorkHistoryScreen(
                  personalDetails: personalDetails,
                ),
              ));
        },
        child: const Icon(
          Icons.arrow_right,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const HeadingRow(text1: "Personal", text2: "details"),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        controller: firstnamecontroller, hinttext: "Firstname"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomTextField(
                        controller: lastnamecontroller, hinttext: "Lastname"),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                  controller: professioncontroller, hinttext: "profession"),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        controller: gendercontroller, hinttext: "Gender"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomTextField(
                        controller: phonecontroller, hinttext: "Phone"),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        controller: Dobcontroller, hinttext: "DOB"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomTextField(
                        controller: Nationalitycontroller,
                        hinttext: "Nationality"),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(controller: emailcontroller, hinttext: "Email"),
            ],
          ),
        ),
      ),
    );
  }
}
