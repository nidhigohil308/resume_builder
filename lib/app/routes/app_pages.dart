import 'package:get/get.dart';

import '../modules/add_resume_details/bindings/add_resume_details_binding.dart';
import '../modules/add_resume_details/views/add_resume_details_view.dart';
import '../modules/final_resume/bindings/final_resume_binding.dart';
import '../modules/final_resume/views/final_resume_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_RESUME_DETAILS,
      page: () => AddResumeDetailsView(),
      binding: AddResumeDetailsBinding(),
    ),
    GetPage(
      name: _Paths.FINAL_RESUME,
      page: () => FinalResumeView(),
      binding: FinalResumeBinding(),
    ),
  ];
}
