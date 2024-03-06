import 'package:get/get.dart';

import '../controllers/add_resume_details_controller.dart';

class AddResumeDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddResumeDetailsController>(
      () => AddResumeDetailsController(),
    );
  }
}
