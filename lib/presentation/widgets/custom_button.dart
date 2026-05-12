import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtonOne extends StatelessWidget {
  final Function() onPressed;
  final String buttomTitle;

  const AppButtonOne(
      {Key? key, required this.onPressed, required this.buttomTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade900,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          buttomTitle,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class AppButtonTwo extends StatelessWidget {
  final Function() onPreviousPressed;
  final Function() onNextPressed;

  const AppButtonTwo(
      {Key? key, required this.onNextPressed, required this.onPreviousPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 48.h,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue.shade900,
                  side: BorderSide(color: Colors.blue.shade900),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: onPreviousPressed,
                child: Text(
                  'Previous',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                )),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
            child: SizedBox(
          height: 48.h,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 0,
              ),
              onPressed: onNextPressed,
              child: Text(
                'Next',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
              )),
        ))
      ],
    );
  }
}

class CustomRadioButton extends StatelessWidget {
  final int selectedValue;
  final Function(dynamic) onPressed;

  const CustomRadioButton(
      {Key? key, required this.onPressed, required this.selectedValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Male'),
        Radio(
          value: 1,
          groupValue: selectedValue,
          activeColor: Colors.blue.shade900,
          onChanged: onPressed,
        ),
        const Text('Female'),
        Radio(
          value: 2,
          groupValue: selectedValue,
          activeColor: Colors.blue.shade900,
          onChanged: onPressed,
        )
      ],
    );
  }
}
