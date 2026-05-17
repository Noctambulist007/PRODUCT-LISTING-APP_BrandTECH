import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productify/presentation/theme/color.dart';
import 'package:productify/presentation/theme/text_styles.dart';
import 'package:productify/presentation/theme/text_theme.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    required this.subTitle,
    required this.iconPath,
    required this.positiveButtonText,
    required this.negativeButtonText,
    this.onPositiveButtonClick,
    this.onNegativeButtonClick,
    this.showCloseIconButton = true,
  });

  final String iconPath;
  final String title;
  final String subTitle;
  final String positiveButtonText;
  final String negativeButtonText;
  final VoidCallback? onPositiveButtonClick;
  final VoidCallback? onNegativeButtonClick;
  final bool showCloseIconButton;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 64.w,
                  height: 64.h,
                  padding: EdgeInsets.all(8.h),
                  decoration: BoxDecoration(
                    color: AppColors.grayscaleSurfaceGrayBackground,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: SvgPicture.asset(iconPath, width: 48.w, height: 48.h),
                ),

                const Spacer(),

                if (showCloseIconButton) ...[
                  GestureDetector(
                    onTap: Navigator.of(context).pop,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.grayscaleSurfaceGrayBackground,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close,
                        color: AppColors.grayscaleTextSubtitle,
                        size: 20.r,
                      ),
                    ),
                  ),
                ],
              ],
            ),

            SizedBox(height: 24.h),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.labelL3Semibold.copyWith(
                    color: AppColors.grayscaleTextBody,
                  ),
                ),

                SizedBox(height: 6.h),

                Text(
                  subTitle,
                  style: AppTextStyles.paragraphP3Regular.copyWith(
                    color: AppColors.grayscaleTextSubtitle,
                  ),
                ),
              ],
            ),

            SizedBox(height: 24.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CommonCustomButton(
                    isSelected: false,
                    label: negativeButtonText,
                    onPressed: () {
                      Navigator.of(context).pop();
                      onNegativeButtonClick?.call();
                    },
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: CommonCustomButton(
                    isSelected: true,
                    label: positiveButtonText,
                    onPressed: () {
                      Navigator.of(context).pop();
                      onPositiveButtonClick?.call();
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}

class CommonCustomButton extends StatelessWidget {
  const CommonCustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isSelected = false,
    this.customWidth = double.infinity,
    this.verticalPadding = 12.0,
    this.borderRadius = 32.0,
    this.fontSize = 16.0,
    this.selectedColor,
    this.unselectedColor = Colors.white,
    this.borderColor,
    this.borderWidth = 0.5,
    this.fontWeight = FontWeight.normal,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isSelected;
  final double customWidth;
  final double verticalPadding;
  final double borderRadius;
  final double fontSize;
  final Color? selectedColor;
  final Color unselectedColor;
  final Color? borderColor;
  final double borderWidth;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    final Color activeColor = selectedColor ?? AppColors.colorPrimary;
    final Color activeBorderColor = borderColor ?? activeColor;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.h),
        height: 48.h,
        width: customWidth.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius.r),
          color: isSelected ? AppColors.colorPrimary : unselectedColor,
          border: Border.all(
            color: isSelected ? activeBorderColor : AppColors.colorBlack,
            width: borderWidth.w,
          ),
        ),

        child: Text(
          label,
          style: textTheme.bodyMedium?.copyWith(
            color: isSelected ? Colors.white : AppColors.colorBlack,
            fontSize: fontSize.sp,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
