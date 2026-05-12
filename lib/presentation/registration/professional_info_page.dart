import 'package:assignment_one/core/constants.dart';
import 'package:assignment_one/core/utils.dart';
import 'package:assignment_one/presentation/registration/address_info_page.dart';
import 'package:assignment_one/presentation/widgets/custom_button.dart';
import 'package:assignment_one/presentation/widgets/custom_input_widgets.dart';
import 'package:assignment_one/view_models/professional_info_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ProfessionalInfoPage extends GetView<ProfessionalPageController> {
  const ProfessionalInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfessionalPageController());

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Visibility(
            visible: true,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          title: Text(
            'Your Info',
            style: TextStyle(fontSize: 24.sp, color: Colors.black),
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              constraints: const BoxConstraints(maxWidth: 640),
              width: double.infinity,
              child: Form(
                key: controller.yourInfoFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Educational Info',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    CustomDropdownTextField(
                      key: const Key('education'),
                      listItem: qualification,
                      prefixIcon: const Icon(Icons.school_outlined),
                      headingText: 'Education',
                      hintText: 'Select your qualification',
                      controller: controller.educationController,
                      onSelect: (value) {
                        controller.educationController.text = value;
                      },
                      onValidate: (value) {
                        if (value.toString().isNotEmpty) {
                          return null;
                        } else {
                          return 'Education field is required';
                        }
                      },
                    ),
                    CustomDropdownTextField(
                      key: const Key('passing_year'),
                      listItem: Utils.getList(),
                      prefixIcon: const Icon(Icons.calendar_month_outlined),
                      headingText: 'Year of passing*',
                      hintText: 'Enter year of passing',
                      controller: controller.yearOfPassingController,
                      onValidate: (value) {
                        if (value.toString().isNotEmpty) {
                          return null;
                        } else {
                          return 'Please select passing year';
                        }
                      },
                      onSelect: (value) {
                        controller.yearOfPassingController.text = value;
                      },
                    ),
                    CustomTextField(
                      key: const Key('grade'),
                      controller: controller.gradeController,
                      inputType: TextInputType.number,
                      prefixIcon: const Icon(Icons.grade_outlined),
                      headingText: 'Grade',
                      hintText: 'Enter your grade OR percentage ',
                      onValidate: (value) {},
                      onSave: (value) {},
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Professional Info',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    CustomTextField(
                      key: const Key('experience'),
                      controller: controller.experienceController,
                      inputType: TextInputType.number,
                      prefixIcon: const Icon(Icons.work_outline),
                      headingText: 'Experience*',
                      hintText: 'Enter the year of experience',
                      onValidate: (value) {},
                      onSave: (value) {},
                    ),
                    CustomDropdownTextField(
                      key: const Key('designation'),
                      listItem: designation,
                      prefixIcon: const Icon(Icons.badge_outlined),
                      headingText: 'Designation*',
                      hintText: 'Select designation',
                      controller: controller.designationController,
                      onSelect: (value) {
                        controller.designationController.text = value;
                      },
                      onValidate: (value) {
                        return null;
                      },
                    ),
                    CustomDropdownTextField(
                      key: const Key('domain'),
                      listItem: domain,
                      prefixIcon: const Icon(Icons.category_outlined),
                      headingText: 'Domain*',
                      hintText: 'Select your domain',
                      controller: controller.domainController,
                      onSelect: (value) {
                        controller.domainController.text = value;
                      },
                      onValidate: (value) {
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AppButtonTwo(
                      key: const Key('previous-next-button'),
                      onNextPressed: () {
                        if (controller.saveData()) {
                          Get.to(() => const AddressInfoPage());
                        }
                      },
                      onPreviousPressed: () {
                        Get.back();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
