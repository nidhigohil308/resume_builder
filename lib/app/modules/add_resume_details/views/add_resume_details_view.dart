import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../controllers/add_resume_details_controller.dart';

class AddResumeDetailsView extends GetView<AddResumeDetailsController> {
  AddResumeDetailsView({super.key});
  final AddResumeDetailsController addResumeDetailsController =
      Get.put(AddResumeDetailsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddResumeDetailsController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Resume Maker'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: addResumeDetailsController.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addResumeDetailsController.image == null
                      ? GestureDetector(
                          onTap: () {
                            addResumeDetailsController.pickImage();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: const Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 30,
                            ),
                          ))
                      : Image.file(
                          addResumeDetailsController.image!,
                          height: 100,
                          width: 100,
                        ),
                  TextFormField(
                    controller: addResumeDetailsController.txtName,
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        addResumeDetailsController.resume.update((resume) {
                      resume!.name = value;
                    }),
                  ),
                  TextFormField(
                    controller: addResumeDetailsController.txtEmail,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(
                              r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                          .hasMatch(value.trim())) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        addResumeDetailsController.resume.update((resume) {
                      resume!.email = value.trim();
                    }),
                  ),
                  TextFormField(
                    controller: addResumeDetailsController.txtPhone,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        addResumeDetailsController.resume.update((resume) {
                      resume!.phoneNumber = value;
                    }),
                  ),
                  TextFormField(
                    controller: addResumeDetailsController.txtEducation,
                    decoration: const InputDecoration(labelText: 'Education'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your education details';
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        addResumeDetailsController.resume.update((resume) {
                      resume!.education = value;
                    }),
                  ),
                  TextFormField(
                    controller: addResumeDetailsController.txtWorkExperience,
                    decoration:
                        const InputDecoration(labelText: 'Work Experience'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your work experience';
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        addResumeDetailsController.resume.update((resume) {
                      resume!.workExperience = value;
                    }),
                  ),
                  TextFormField(
                    controller: addResumeDetailsController.txtSkill,
                    decoration: const InputDecoration(labelText: 'Skills'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your skills';
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        addResumeDetailsController.resume.update((resume) {
                      resume!.skills = value;
                    }),
                  ),
                  TextFormField(
                    controller: addResumeDetailsController.txtLanguage,
                    decoration: const InputDecoration(labelText: 'Languages'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your knowne languages';
                      }
                      return null;
                    },
                    onChanged: (value) =>
                        addResumeDetailsController.resume.update((resume) {
                      resume!.languages = value;
                    }),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      // Save the resume data to SQLite
                      addResumeDetailsController.addEditDetails();
                    },
                    child: const Text('Save Resume'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
