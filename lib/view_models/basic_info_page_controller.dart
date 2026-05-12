import 'package:assignment_one/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BasicInfoPageController extends GetxController {
  final _userModel = UserModel().obs;
  final GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();
  late TextEditingController fNameController,
      lNameController,
      emailController,
      passwordController,
      confirmPasswordController,
      phoneNumberController;

  var isPassWord = false.obs;

  showPass(bool value) => isPassWord.value = value;

  var selectedRadio = 1.obs;

  switchRadioButton(int value) => selectedRadio.value = value;

  var profileImagePath = ''.obs;

  pickImage(String imagePath) => profileImagePath.value = imagePath;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    lNameController = TextEditingController();
    fNameController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    lNameController.dispose();
    fNameController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
  }

  bool saveData() {
    final isValid = registrationFormKey.currentState!.validate();
    if (!isValid) {
      return false;
    }
    registrationFormKey.currentState!.save();
    return true;
  }

// UserModel getUserModel() {
//   return _userModel.value;
// }
//
// void firstName(String value) {
//   _userModel.value = _userModel.value.copyWith(firstName: value);
// }
//
// void lastname(String value) {
//   _userModel.value = _userModel.value.copyWith(lastName: value);
// }
//
// void email(String email) {
//   _userModel.value = _userModel.value.copyWith(email: email);
// }
}
