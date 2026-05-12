import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String headingText;
  final String hintText;
  final Widget prefixIcon;
  final TextInputType inputType;
  final TextInputAction? textInputAction;
  final dynamic onValidate;
  final Function(String?) onSave;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.headingText,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    required this.inputType,
    this.textInputAction,
    required this.onValidate,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.h,
        ),
        Text(
          headingText,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          maxLines: 1,
          maxLength: inputType != TextInputType.number ? null : 10,
          textInputAction: textInputAction ?? TextInputAction.next,
          keyboardType: inputType,
          onSaved: onSave,
          autofocus: false,
          textAlign: TextAlign.left,
          validator: onValidate,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade50,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue.shade900, width: 1.4),
            ),
            counterText: '',
            contentPadding:
                EdgeInsets.symmetric(vertical: 18.h, horizontal: 8.h),
            prefixIcon: IconTheme(
              data: IconThemeData(color: Colors.blue.shade900, size: 22.r),
              child: prefixIcon,
            ),
            // border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade500),
          ),
          controller: controller,
        ),
      ],
    );
  }
}

class CustomPasswordField extends StatelessWidget {
  final String headingText;
  final String hintText;
  final Widget prefixIcon;
  final dynamic onValidate;
  final Function(String?) onSave;
  final Function() showPassword;
  final bool passwordEnable;
  final TextEditingController? controller;

  const CustomPasswordField({
    Key? key,
    required this.headingText,
    required this.hintText,
    required this.prefixIcon,
    required this.onValidate,
    required this.onSave,
    required this.showPassword,
    required this.passwordEnable,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5.h,
        ),
        Text(
          headingText,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        TextFormField(
          maxLines: 1,
          obscureText: passwordEnable == true ? false : true,
          obscuringCharacter: "*",
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          validator: onValidate,
          autofocus: false,
          onSaved: onSave,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade50,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue.shade900, width: 1.4),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 18.h, horizontal: 8.w),
            suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                passwordEnable ? Icons.visibility : Icons.visibility_off,
                color: Colors.blue.shade900,
              ),
              onPressed: showPassword,
            ),
            prefixIcon: IconTheme(
              data: IconThemeData(color: Colors.blue.shade900, size: 22.r),
              child: prefixIcon,
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade500),
          ),
          controller: controller,
        ),
      ],
    );
  }
}

class CustomDropdownTextField extends StatelessWidget {
  final String headingText;
  final String hintText;
  final Function(String) onSelect;
  final TextEditingController? controller;
  final List<String> listItem;
  final dynamic onValidate;
  final Widget? prefixIcon;

  const CustomDropdownTextField({
    Key? key,
    required this.headingText,
    required this.hintText,
    required this.onSelect,
    required this.listItem,
    required this.onValidate,
    this.prefixIcon,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.h,
        ),
        Text(
          headingText,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          autofocus: false,
          textInputAction: TextInputAction.done,
          maxLines: 1,
          textAlign: TextAlign.left,
          validator: onValidate,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade50,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue.shade900, width: 1.4),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 18.h, horizontal: 8.w),
            prefixIcon: prefixIcon == null
                ? null
                : IconTheme(
                    data:
                        IconThemeData(color: Colors.blue.shade900, size: 22.r),
                    child: prefixIcon!,
                  ),
            suffixIcon: PopupMenuButton<String>(
              icon:
                  Icon(Icons.keyboard_arrow_down, color: Colors.blue.shade900),
              onSelected: onSelect,
              itemBuilder: (BuildContext context) {
                return listItem.map<PopupMenuItem<String>>((String value) {
                  return PopupMenuItem(child: Text(value), value: value);
                }).toList();
              },
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade500),
          ),
          controller: controller,
        ),
      ],
    );
  }
}
