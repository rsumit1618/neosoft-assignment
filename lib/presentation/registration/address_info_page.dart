import 'package:assignment_one/core/constants.dart';
import 'package:assignment_one/core/field_validator.dart';
import 'package:assignment_one/presentation/registration/summary_page.dart';
import 'package:assignment_one/presentation/widgets/custom_button.dart';
import 'package:assignment_one/presentation/widgets/custom_input_widgets.dart';
import 'package:assignment_one/view_models/address_info_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddressInfoPage extends GetView<AddressInfoPage> {
  const AddressInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressPageController());

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
            'Your Address',
            style: TextStyle(fontSize: 24.sp, color: Colors.black),
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                constraints: const BoxConstraints(maxWidth: 640),
                width: double.infinity,
                child: Form(
                  key: controller.addressPageController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                        key: const Key('address'),
                        prefixIcon: const Icon(Icons.home_outlined),
                        headingText: 'Address',
                        hintText: 'Address',
                        inputType: TextInputType.text,
                        onValidate: (value) {
                          if (InputFieldOne(value).isValid()) {
                            return null;
                          } else {
                            return 'Address is required';
                          }
                        },
                        onSave: (value) {},
                        controller: controller.addressController,
                      ),
                      CustomTextField(
                        key: const Key('landmark'),
                        inputType: TextInputType.text,
                        prefixIcon: const Icon(Icons.place_outlined),
                        headingText: 'Locality / Landmark',
                        hintText: 'Locality/Landmark',
                        controller: controller.localityLandmarkController,
                        onSave: (value) {},
                        onValidate: (value) {
                          if (InputFieldOne(value).isValid()) {
                            return null;
                          } else {
                            return 'Locality/Landmark is required';
                          }
                        },
                      ),
                      CustomTextField(
                        key: const Key('city'),
                        inputType: TextInputType.text,
                        prefixIcon: const Icon(Icons.location_city_outlined),
                        headingText: 'City',
                        hintText: 'City',
                        onValidate: (value) {},
                        onSave: (value) {},
                        controller: controller.cityController,
                      ),
                      CustomDropdownTextField(
                        key: const Key('state'),
                        headingText: 'State',
                        listItem: state,
                        prefixIcon: const Icon(Icons.map_outlined),
                        hintText: 'Select your state',
                        onSelect: (value) {
                          controller.stateController.text = value;
                        },
                        onValidate: (value) {
                          if (InputFieldOne(value).isValid()) {
                            return null;
                          } else {
                            return 'Please select your state';
                          }
                        },
                        controller: controller.stateController,
                      ),
                      CustomTextField(
                        key: const Key('pin-code'),
                        inputType: TextInputType.number,
                        prefixIcon: const Icon(Icons.pin_drop_outlined),
                        headingText: 'Pin Code',
                        hintText: 'Pin Code',
                        onSave: (value) {},
                        onValidate: (value) {
                          if (value.toString().isEmpty ||
                              value.toString().length == 6) {
                            return null;
                          } else {
                            return 'Pin Code must be in 6 Digits';
                          }
                        },
                        controller: controller.pinCodeController,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      AppButtonOne(
                          buttomTitle: 'Submit',
                          onPressed: () {
                            if (controller.saveData()) {
                              Get.to(() => const SummaryPage());
                            }
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
