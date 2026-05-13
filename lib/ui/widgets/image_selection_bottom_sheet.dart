import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/widgets/gradient_button.dart';

class ImageSelectionBottomSheet {
  static Future<XFile?> show({
    required BuildContext context,
    String? title,
  }) async {
    return await showModalBottomSheet<XFile>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      constraints: const BoxConstraints(minWidth: double.infinity),
      builder: (BuildContext context) {
        return ImageSelectionBottomSheetContent(title: title ?? 'Select Image');
      },
    );
  }
}

class ImageSelectionBottomSheetContent extends StatefulWidget {
  final String title;

  const ImageSelectionBottomSheetContent({super.key, required this.title});

  @override
  State<ImageSelectionBottomSheetContent> createState() =>
      _ImageSelectionBottomSheetContentState();
}

class _ImageSelectionBottomSheetContentState
    extends State<ImageSelectionBottomSheetContent> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
      );

      if (image != null) {
        Navigator.of(context).pop(image);
      }
    } catch (e, s) {
      // Handle error
      log('Error picking image: $e', stackTrace: s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(height: 15.h),

              // Options
              Row(
                children: [
                  // Camera option
                  Expanded(
                    child: _buildOption(
                      icon: Icons.camera_alt,
                      title: 'Camera',
                      subtitle: 'Take a photo',
                      onTap: () => _pickImage(ImageSource.camera),
                    ),
                  ),
                  SizedBox(width: 16.w),

                  // Gallery option
                  Expanded(
                    child: _buildOption(
                      icon: Icons.photo_library,
                      title: 'Gallery',
                      subtitle: 'Choose from gallery',
                      onTap: () => _pickImage(ImageSource.gallery),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15.h),
              GradientButton(
                text: 'Cancel',
                onPressed: () => Navigator.of(context).pop(),
              ),

              // SizedBox(
              //   width: double.infinity,
              //   child: OutlinedButton(
              //     onPressed: () => Navigator.of(context).pop(),
              //     child: const Text('Cancel'),
              //   ),
              // ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.textFeildBorder, width: 1.sp),
        ),
        child: Column(
          children: [
            Container(
              width: 60.w,
              height: 60.h,
              decoration: const BoxDecoration(
                gradient: AppColors.buttonGradient,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.white, size: 28.sp),
            ),
            SizedBox(height: 12.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
