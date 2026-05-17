import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productify/domain/model/nav_item/navigation_item.dart';
import 'package:productify/presentation/theme/color.dart';
import 'package:productify/presentation/theme/text_theme.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  final int selectedIndex;
  final Function(int) onItemSelected;

  @override
  Widget build(BuildContext context) {
    var items = [
      NavigationItem(icon: "assets/icons/ic-home.svg", label: "Home"),
      NavigationItem(icon: "assets/icons/ic-home.svg", label: "Home"),
    ];

    return NavigationBarTheme(
      data: NavigationBarThemeData(
        backgroundColor: AppColors.grayscaleSurfaceDefault,
        indicatorColor: AppColors.colorPrimary,
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.08),

        iconTheme: WidgetStateProperty.resolveWith((states) {
          return IconThemeData(
            color: states.contains(WidgetState.selected)
                ? AppColors.colorPrimary
                : AppColors.grayscaleIconDefault,
            size: 24.r,
          );
        }),

        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          return textTheme.bodyLarge?.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: states.contains(WidgetState.selected)
                ? AppColors.colorPrimary
                : AppColors.grayscaleTextSubtitle,
          );
        }),
      ),
      child: NavigationBar(
        height: 68.h,
        selectedIndex: selectedIndex,
        onDestinationSelected: onItemSelected,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: items.map((item) {
          final int index = items.indexOf(item);
          final bool isSelected = selectedIndex == index;

          return NavigationDestination(
            label: item.label,
            icon: SvgPicture.asset(
              item.icon,
              width: 24.w,
              height: 24.h,
              colorFilter: ColorFilter.mode(
                isSelected ? AppColors.colorWhite : AppColors.grayscaleIconDefault,
                BlendMode.srcIn,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}