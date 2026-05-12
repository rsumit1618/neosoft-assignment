import 'dart:io';

import 'package:assignment_one/presentation/widgets/custom_button.dart';
import 'package:assignment_one/view_models/address_info_page_controller.dart';
import 'package:assignment_one/view_models/basic_info_page_controller.dart';
import 'package:assignment_one/view_models/professional_info_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final basicController = Get.find<BasicInfoPageController>();
    final professionalController = Get.find<ProfessionalPageController>();
    final addressController = Get.find<AddressPageController>();
    final imagePath = basicController.profileImagePath.value;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Complete Profile',
          style: TextStyle(fontSize: 24.sp, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            constraints: const BoxConstraints(maxWidth: 720),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 36.r,
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage: imagePath.isNotEmpty
                          ? Image.file(File(imagePath), fit: BoxFit.cover).image
                          : null,
                      child: imagePath.isEmpty
                          ? Icon(Icons.person_outline,
                              color: Colors.blue.shade900, size: 30.r)
                          : null,
                    ),
                    SizedBox(width: 14.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${basicController.fNameController.text} ${basicController.lNameController.text}'
                                .trim(),
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            basicController.emailController.text,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                _SummarySection(
                  title: 'Basic Info',
                  onEdit: () => Get.until((route) => route.isFirst),
                  children: [
                    _SummaryRow(
                        'First Name', basicController.fNameController.text),
                    _SummaryRow(
                        'Last Name', basicController.lNameController.text),
                    _SummaryRow(
                        'Phone', basicController.phoneNumberController.text),
                    _SummaryRow('Email', basicController.emailController.text),
                    _SummaryRow(
                        'Gender',
                        basicController.selectedRadio.value == 1
                            ? 'Male'
                            : 'Female'),
                  ],
                ),
                _SummarySection(
                  title: 'Professional Info',
                  onEdit: () {
                    Get.back();
                    Get.back();
                  },
                  children: [
                    _SummaryRow('Education',
                        professionalController.educationController.text),
                    _SummaryRow('Passing Year',
                        professionalController.yearOfPassingController.text),
                    _SummaryRow(
                        'Grade', professionalController.gradeController.text),
                    _SummaryRow('Experience',
                        professionalController.experienceController.text),
                    _SummaryRow('Designation',
                        professionalController.designationController.text),
                    _SummaryRow(
                        'Domain', professionalController.domainController.text),
                  ],
                ),
                _SummarySection(
                  title: 'Address',
                  onEdit: () => Get.back(),
                  children: [
                    _SummaryRow(
                        'Address', addressController.addressController.text),
                    _SummaryRow('Landmark',
                        addressController.localityLandmarkController.text),
                    _SummaryRow('City', addressController.cityController.text),
                    _SummaryRow(
                        'State', addressController.stateController.text),
                    _SummaryRow(
                        'Pin Code', addressController.pinCodeController.text),
                  ],
                ),
                SizedBox(height: 8.h),
                AppButtonOne(
                  buttomTitle: 'Done',
                  onPressed: () => Get.until((route) => route.isFirst),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SummarySection extends StatelessWidget {
  const _SummarySection({
    required this.title,
    required this.children,
    required this.onEdit,
  });

  final String title;
  final List<Widget> children;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18.h),
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: onEdit,
                icon: const Icon(Icons.edit_outlined, size: 18),
                label: const Text('Edit'),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          ...children,
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final displayValue = value.trim().isEmpty ? '-' : value.trim();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 118.w,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              displayValue,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
