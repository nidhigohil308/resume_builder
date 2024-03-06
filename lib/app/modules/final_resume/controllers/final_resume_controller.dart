import 'package:get/get.dart';

import '../../../model/resume_model.dart';
import '../../../services/database_helpr.dart';

class FinalResumeController extends GetxController {
  dynamic argument = Get.arguments;
  final DatabaseHelper databaseHelper = DatabaseHelper();
  ResumeModel? resumeDetail;
  @override
  void onInit() {
    super.onInit();
      getResumDetail();
    
  }

  getResumDetail() async {
    if (argument == null) {
      List<ResumeModel> resumes = await databaseHelper.getAllResumes();
      if (resumes.isNotEmpty) {
        resumeDetail = resumes.last;
        update();
        print('Last inserted resume: $resumeDetail');
      } else {
        print('No resumes in the database');
      }
    } else {
      ResumeModel resume = await databaseHelper.getResumeById(argument);
      resumeDetail = resume;
      update();
      print('Last inserted resume: $resumeDetail');
    }
  }
}
