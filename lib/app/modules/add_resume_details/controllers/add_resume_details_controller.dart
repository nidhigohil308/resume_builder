import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


import '../../../model/resume_model.dart';
import '../../../services/database_helpr.dart';
import '../../final_resume/views/final_resume_view.dart';

class AddResumeDetailsController extends GetxController {
  dynamic argument = Get.arguments;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? image;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtEducation = TextEditingController();
  TextEditingController txtWorkExperience = TextEditingController();
  TextEditingController txtSkill = TextEditingController();
  TextEditingController txtLanguage = TextEditingController();

  final DatabaseHelper databaseHelper = DatabaseHelper();
  var resume = ResumeModel().obs;
  @override
  void onInit() {
    super.onInit();
    getDetailsFromArgument();
  }

  void updateResume({
    int? id,
    required String imagePath,
    required String name,
    required String email,
    required String phoneNumber,
    required String education,
    required String workExperience,
    required String skills,
    required String languages,
  }) {
    resume(ResumeModel(
        id: id,
        imagePath: imagePath,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        education: education,
        workExperience: workExperience,
        skills: skills,
        languages: languages));
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      resume.update((val) {
        val!.imagePath = image!.path;
      });
    }
    update();
  }

  getDetailsFromArgument() {
    if (argument != null) {
      ResumeModel resumeModel = argument;
      txtName.text = resumeModel.name!;
      txtEducation.text = resumeModel.education!;
      txtEmail.text = resumeModel.email!;
      txtPhone.text = resumeModel.phoneNumber!;
      txtWorkExperience.text = resumeModel.workExperience!;
      txtSkill.text = resumeModel.skills!;
      txtLanguage.text = resumeModel.languages!;
      updateResume(
          id: resumeModel.id,
          imagePath: resumeModel.imagePath!,
          name: resumeModel.name!,
          email: resumeModel.email!,
          phoneNumber: resumeModel.phoneNumber!,
          education: resumeModel.education!,
          workExperience: resumeModel.workExperience!,
          skills: resumeModel.skills!,
          languages: resumeModel.languages!);
    }
  }

  addEditDetails() async {
    if (formKey.currentState?.validate() ?? false) {
      int result = argument == null
          ? await databaseHelper.insertResume(resume.value)
          : await databaseHelper.updateResumeById(argument.id, resume.value);
      if (result != 0) {
        print('Resume saved to SQLite database');
        Get.off(() => FinalResumeView());
      } else {
        print('Error saving resume to SQLite database');
      }
    }
  }
}
