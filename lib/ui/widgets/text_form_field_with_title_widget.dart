import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';

import '../resources/app_fonts.dart';

class TextFormFieldWithTitleWidget extends StatelessWidget {
  const TextFormFieldWithTitleWidget({
    super.key,
    required this.title,
    required this.controller,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.formKey,
    this.validator,
    this.readOnly = false,
    this.maxLines = 1,
  });

  final String title;
  final TextEditingController controller;
  final String? hintText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final GlobalKey<FormState>? formKey;
  final String? Function(String?)? validator;
  final bool readOnly;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppFonts.grey18w400,
            textAlign: .start,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 20.h),
          TextFormField(
            maxLines: maxLines,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            validator: (value) => validator != null ? validator!(value) : null,
            readOnly: readOnly,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText ?? "",

              prefixIcon: prefixIcon != null
                  ? Icon(prefixIcon, color: AppColors.secondary, size: 24.sp)
                  : null,
              suffixIcon: suffixIcon != null
                  ? Icon(suffixIcon, color: AppColors.secondary, size: 24.sp)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
