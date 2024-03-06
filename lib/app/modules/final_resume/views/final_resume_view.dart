import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/final_resume_controller.dart';

class FinalResumeView extends GetView<FinalResumeController> {
  FinalResumeView({super.key});
  final FinalResumeController finalResumeController =
      Get.put(FinalResumeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FinalResumeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Final Resume'),
          centerTitle: true,
        ),
        body: finalResumeController.resumeDetail == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                         Image.file(
                         File( finalResumeController.resumeDetail!.imagePath!),
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                       const SizedBox(width: 20,),
                          Text(
                            finalResumeController.resumeDetail!.name.toString(),
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                padding: const EdgeInsets.all(10),
                                color: Colors.purple[100],
                                child: const Text(
                                  'Education',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Text(
                                finalResumeController.resumeDetail!.education
                                    .toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 3,
                                padding: const EdgeInsets.all(10),
                                color: Colors.purple[100],
                                child: const Text(
                                  'Contact',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Text(
                                finalResumeController.resumeDetail!.email
                                    .toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                finalResumeController.resumeDetail!.phoneNumber
                                    .toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.purple[100],
                        child: const Text(
                          'Experience',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Text(
                        finalResumeController.resumeDetail!.workExperience
                            .toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.purple[100],
                        child: const Text(
                          'Skills',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Text(
                        finalResumeController.resumeDetail!.skills
                            .toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.purple[100],
                        child: const Text(
                          'Languages',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Text(
                        finalResumeController.resumeDetail!.languages
                            .toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
      );
    });
  }
}
