import 'package:assignment_one/view_models/basic_info_page_controller.dart';
import 'package:assignment_one/view_models/professional_info_page_controller.dart';
import 'package:get/get.dart';

class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BasicInfoPageController>(
      () => BasicInfoPageController(),
    );
    Get.lazyPut<ProfessionalPageController>(
      () => ProfessionalPageController(),
    );
  }
}
