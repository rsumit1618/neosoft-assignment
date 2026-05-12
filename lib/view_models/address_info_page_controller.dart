import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddressPageController extends GetxController {
  final GlobalKey<FormState> addressPageController = GlobalKey<FormState>();
  late TextEditingController addressController,
      localityLandmarkController,
      cityController,
      stateController,
      pinCodeController;

  @override
  void onInit() {
    super.onInit();
    addressController = TextEditingController();
    localityLandmarkController = TextEditingController();
    cityController = TextEditingController();
    stateController = TextEditingController();
    pinCodeController = TextEditingController();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    addressController.dispose();
    localityLandmarkController.dispose();
    cityController.dispose();
    stateController.dispose();
    pinCodeController.dispose();
  }

  bool saveData() {
    final isValid = addressPageController.currentState!.validate();
    if (!isValid) {
      return false;
    }
    addressPageController.currentState!.save();
    return true;
  }
}
