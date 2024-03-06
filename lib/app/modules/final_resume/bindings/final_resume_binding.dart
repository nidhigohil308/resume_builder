import 'package:get/get.dart';

import '../controllers/final_resume_controller.dart';

class FinalResumeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinalResumeController>(
      () => FinalResumeController(),
    );
  }
}
