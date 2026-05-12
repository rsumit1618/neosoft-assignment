import 'dart:io';

import 'package:assignment_one/core/field_validator.dart';
import 'package:assignment_one/core/image_picker_utils.dart';
import 'package:assignment_one/presentation/registration/professional_info_page.dart';
import 'package:assignment_one/presentation/widgets/custom_button.dart';
import 'package:assignment_one/presentation/widgets/custom_input_widgets.dart';
import 'package:assignment_one/view_models/basic_info_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:image_picker/image_picker.dart';

class BasicInfoPage extends GetView<BasicInfoPageController> {
  const BasicInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BasicInfoPageController());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            iconTheme:
                const IconThemeData(color: Colors.black //change your color here
                    ),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: false,
            title: Center(
              child: Text('Registration',
                  style: TextStyle(fontSize: 24.sp, color: Colors.black)),
            )),
        resizeToAvoidBottomInset: true,
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
                child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                    constraints: const BoxConstraints(maxWidth: 640),
                    width: double.infinity,
                    // height: MediaQuery.of(context).size.height,
                    child: Form(
                        key: controller.registrationFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.topCenter,
                                  child: CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: 45,
                                      child: GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () async {
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                            final imageSrcPath =
                                                await ImagePickerUtil.instance
                                                    .getCompressedImage(
                                              source: ImageSource.gallery,
                                            );

                                            if (imageSrcPath
                                                .trim()
                                                .isNotEmpty) {
                                              controller
                                                  .pickImage(imageSrcPath);
                                            }
                                          },
                                          child: Obx(() {
                                            final imagePath = controller
                                                .profileImagePath.value;

                                            return CircleAvatar(
                                                radius: 42.r,
                                                backgroundColor: Colors
                                                    .grey.shade200,
                                                backgroundImage: imagePath
                                                        .isNotEmpty
                                                    ? Image.file(
                                                            File(imagePath),
                                                            fit: BoxFit.cover)
                                                        .image
                                                    : null,
                                                child: imagePath.isEmpty
                                                    ? Icon(
                                                        Icons
                                                            .add_a_photo_outlined,
                                                        color: Colors
                                                            .blue.shade900,
                                                        size: 30.r)
                                                    : null);
                                          })))),
                              CustomTextField(
                                  key: const Key('first-name'),
                                  prefixIcon: const Icon(Icons.person_outline),
                                  headingText: 'First Name*',
                                  hintText: 'Enter your first name',
                                  onValidate: (value) {
                                    if (InputFieldOne(value).isValid()) {
                                      return null;
                                    } else {
                                      return 'First name is required';
                                    }
                                  },
                                  controller: controller.fNameController,
                                  onSave: (value) {},
                                  inputType: TextInputType.text),
                              CustomTextField(
                                  key: const Key('last-name'),
                                  controller: controller.lNameController,
                                  inputType: TextInputType.text,
                                  prefixIcon: const Icon(Icons.person),
                                  headingText: 'Last Name*',
                                  hintText: 'Please enter your last name',
                                  onSave: (value) {},
                                  onValidate: (value) {
                                    if (InputFieldOne(value).isValid()) {
                                      return null;
                                    } else {
                                      return 'Last name is required';
                                    }
                                  }),
                              CustomTextField(
                                  key: const Key('phone_number'),
                                  controller: controller.phoneNumberController,
                                  inputType: TextInputType.number,
                                  prefixIcon: const Icon(Icons.phone_android),
                                  headingText: 'Phone number',
                                  hintText: 'Enter your 10 digits phone number',
                                  onValidate: (value) {
                                    if (PhoneNumber(value).isValid()) {
                                      return null;
                                    } else {
                                      return 'Invalid phone number';
                                    }
                                  },
                                  onSave: (value) {}),
                              CustomTextField(
                                  key: const Key('email*'),
                                  controller: controller.emailController,
                                  inputType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.done,
                                  prefixIcon: const Icon(Icons.email_outlined),
                                  headingText: 'Email*',
                                  hintText: 'Your email goes here ',
                                  onValidate: (value) {
                                    if (EmailAddress(value).isValid()) {
                                      return null;
                                    } else {
                                      return 'Invalid email address';
                                    }
                                  },
                                  onSave: (value) {}),
                              SizedBox(height: 10.h),
                              const Text('Gender',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Obx(() => CustomRadioButton(
                                  key: const Key('gender-radio-button'),
                                  onPressed: (value) {
                                    if (controller.selectedRadio.value == 1) {
                                      controller.switchRadioButton(2);
                                    } else {
                                      controller.switchRadioButton(1);
                                    }
                                  },
                                  selectedValue:
                                      controller.selectedRadio.value)),
                              Obx(() => CustomPasswordField(
                                  key: const Key('password'),
                                  prefixIcon: const Icon(Icons.lock_outline),
                                  headingText: 'Password*',
                                  hintText: 'Password',
                                  controller: controller.passwordController,
                                  passwordEnable: controller.isPassWord.value,
                                  showPassword: () {
                                    if (controller.isPassWord.value) {
                                      controller.showPass(false);
                                    } else {
                                      controller.showPass(true);
                                    }
                                  },
                                  onValidate: (value) {
                                    if (Password(value).isValid()) {
                                      return null;
                                    } else {
                                      return 'Password must contain characters, number and special character';
                                    }
                                  },
                                  onSave: (value) {})),
                              CustomTextField(
                                  key: const Key('confirm-password'),
                                  controller:
                                      controller.confirmPasswordController,
                                  inputType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.done,
                                  prefixIcon: const Icon(Icons.lock_reset),
                                  headingText: 'Confirm Password*',
                                  hintText: 'Confirm Password',
                                  onValidate: (value) {
                                    if (controller.passwordController.text ==
                                        value) {
                                      return null;
                                    } else {
                                      return 'Password must be same';
                                    }
                                  },
                                  onSave: (value) {}),
                              SizedBox(height: 20.h),
                              AppButtonOne(
                                  buttomTitle: 'Next',
                                  onPressed: () {
                                    if (controller.saveData()) {
                                      Get.to(
                                          () => const ProfessionalInfoPage());
                                    }
                                  })
                            ]))))));
  }
}
