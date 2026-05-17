import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productify/presentation/theme/color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.width,
    this.height,
    this.icon,
    this.isDisabled = false,
    this.iconAlignment = IconAlignment.start,
    required this.label,
    required this.isLoading,
    required this.onPressed,
  });

  final String label;
  final bool isLoading;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Widget? icon;
  final IconAlignment iconAlignment;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (isLoading || isDisabled) ? null : onPressed,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.all(0.h)),
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
        ),
        overlayColor: WidgetStateProperty.resolveWith(
              (states) => states.contains(MaterialState.pressed)
              ? Colors.black12
              : Colors.transparent,
        ),
        minimumSize: WidgetStateProperty.all(Size(double.infinity, 53.h)),
      ),

      child: Ink(
        height: 53.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isLoading
                ? [Colors.grey, Colors.grey.shade400]
                : [AppColors.colorPrimary, AppColors.colorPrimary],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Container(
          alignment: Alignment.center,
          child: isLoading
              ? SizedBox(
            height: 24.h,
            width: 24.w,
            child: CircularProgressIndicator.adaptive(
              strokeWidth: 2.w,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.colorOnPrimary,
              ),
            ),
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) icon!,
              if (icon != null) SizedBox(width: 8.w),
              Text(
                label,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
