import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../../add_resume_details/views/add_resume_details_view.dart';
import '../../final_resume/views/final_resume_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Resumes'),
          centerTitle: true,
        ),
        body: homeController.resumes == [] ? const Center(child: Text('No Resumes'),):ListView.builder(
          itemCount: homeController.resumes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => FinalResumeView(),
                    arguments: homeController.resumes[index].id!);
              },
              child: Card(
                margin: const EdgeInsets.all(10),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        homeController.resumes[index].name!,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.to(() => AddResumeDetailsView(),
                                        arguments:
                                            homeController.resumes[index])!
                                    .then(
                                        (value) => homeController.getResumes());
                              },
                              child: const Icon(
                                Icons.edit,
                                color: Colors.green,
                                size: 20,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                              onTap: () {
                                homeController.deleteResume(
                                    homeController.resumes[index].id!);
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 20,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => AddResumeDetailsView())!.then(
                                        (value) => homeController.getResumes());
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
