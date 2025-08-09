import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starting_slicing/app/constants/export.dart';

class IntroButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isPrimary;

  const IntroButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isPrimary ? AppColor.Screen : Colors.grey.shade300,
        minimumSize: Size.fromHeight(36.h), // tinggi tombol kecil
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: 8.h),
      ),
      child: Text(
        text,
        style: AppTextStyle.bold(
          fontSize: 12.sp,
          color: isPrimary ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
