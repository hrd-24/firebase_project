import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starting_slicing/app/constants/export.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    this.text,
    this.onPressed,
    this.backgroundColor,
    this.isLoading = false,
    this.textColor,
    this.useShadow = false,
  });

  final String? text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isLoading;
  final bool useShadow;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColor.primary,
        minimumSize: Size.fromHeight(48.h), // ✅ responsif tinggi tombol
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.radius12, // ✅ responsif border radius
        ),
        elevation: useShadow ? 6 : 0,
        shadowColor: useShadow ? Colors.black.withOpacity(0.2) : null,
        padding: AppSpacing.vertical16, // ✅ padding internal responsif
      ),
      child: isLoading
          ? SizedBox(
              height: 20.w, // ✅ responsif loading indicator
              width: 20.w,
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
                color: textColor ?? Colors.white,
              ),
            )
          : Text(
              text ?? 'Lanjutkan',
              style: AppTextStyle.bold(
                fontSize: AppFontSize.button, // ✅ gunakan fontSize responsif
                color: textColor ?? Colors.white,
              ),
            ),
    );
  }
}
