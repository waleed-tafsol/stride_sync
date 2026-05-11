import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final IconData? actionIcon;
  final Widget? leadingWidget;
  final VoidCallback? onMenuTap;
  final VoidCallback? onBellTap;

  const CustomAppBar({
    super.key,
    this.title,
    this.leadingWidget,
    this.onMenuTap,
    this.onBellTap,
    this.actionIcon,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          if (leadingWidget != null)
            GestureDetector(onTap: onMenuTap, child: leadingWidget),
          if (leadingWidget != null) SizedBox(width: 16.w),
          Text(title ?? "", style: AppFonts.black20w600),
        ],
      ),
      actions: [
        if (actionIcon != null)
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: GestureDetector(
              onTap: onBellTap,
              child: Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  gradient: AppColors.buttonGradient,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.buttonBorder),
                ),
                child: Icon(actionIcon, size: 22.sp, color: AppColors.white),
              ),
            ),
          ),
      ],
    );
  }
}
