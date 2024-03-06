import 'package:get/get.dart';

import '../../../model/resume_model.dart';
import '../../../services/database_helpr.dart';

class HomeController extends GetxController {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  RxList<ResumeModel> resumes = <ResumeModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    getResumes();
  }

  getResumes() async {
    resumes.value = await databaseHelper.getAllResumes();
    update();
  }
  
  deleteResume(int id)async{
    int deleteId = await databaseHelper.deleteResumeById(id);
    if (deleteId>0) {
      resumes.value = await databaseHelper.getAllResumes();
    update();
    }

  }
}
