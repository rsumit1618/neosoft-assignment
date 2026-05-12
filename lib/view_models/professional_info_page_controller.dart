import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfessionalPageController extends GetxController {
  final GlobalKey<FormState> yourInfoFormKey = GlobalKey<FormState>();
  late TextEditingController educationController,
      yearOfPassingController,
      gradeController,
      experienceController,
      designationController,
      domainController;

  @override
  void onInit() {
    super.onInit();
    educationController = TextEditingController();
    yearOfPassingController = TextEditingController();
    gradeController = TextEditingController();
    experienceController = TextEditingController();
    designationController = TextEditingController();
    domainController = TextEditingController();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    educationController.dispose();
    yearOfPassingController.dispose();
    gradeController.dispose();
    experienceController.dispose();
    designationController.dispose();
    domainController.dispose();
  }

  bool saveData() {
    final isValid = yourInfoFormKey.currentState!.validate();
    if (!isValid) {
      return false;
    }
    yourInfoFormKey.currentState!.save();
    return true;
  }
}
