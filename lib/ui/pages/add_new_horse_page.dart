import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stride_sync/constant/assets.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';
import 'package:stride_sync/ui/widgets/app_back_button.dart';
import 'package:stride_sync/ui/widgets/custom_app_bar.dart';
import 'package:stride_sync/ui/widgets/text_form_field_with_title_widget.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

class AddNewHorsePage extends StatelessWidget {
  static const String routeName = '/add-new-horse';

  const AddNewHorsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Add New Horse",
        leadingWidget: AppBackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              GestureDetector(
                onTap: () {},
                child: DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    color: AppColors.secondary,
                    radius: Radius.circular(12.r),
                    dashPattern: [6, 5],
                    strokeWidth: 2.w,
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    height: 240.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      image: const DecorationImage(
                        image: AssetImage(DummyAssets.horseDetail),
                        fit: BoxFit.cover,

                        opacity: 0.4,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            gradient: AppColors.buttonGradient,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            TablerIcons.cameraPlus,
                            size: 22.sp,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text("Upload Horse Photo", style: AppFonts.black20w700),
                        SizedBox(height: 4.h),
                        Text(
                          "PNG or JPG, max 10MB",
                          style: AppFonts.grey14w400,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    TextFormFieldWithTitleWidget(
                      title: "Horse Name",
                      controller: TextEditingController(),
                      hintText: "e.g. Midnight Thunder",
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormFieldWithTitleWidget(
                            title: "Registration Number",
                            controller: TextEditingController(),
                            hintText: "123",
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextFormFieldWithTitleWidget(
                            title: "Brand / Tattoo",
                            controller: TextEditingController(),
                            hintText: "Q567",
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormFieldWithTitleWidget(
                            title: "Breed",
                            controller: TextEditingController(),
                            hintText: "123",
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextFormFieldWithTitleWidget(
                            title: "Age (Years)",
                            controller: TextEditingController(),
                            hintText: "05",
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),
                    TextFormFieldWithTitleWidget(
                      title: "Color",
                      controller: TextEditingController(),
                      hintText: "Bay",
                    ),
                    TextFormFieldWithTitleWidget(
                      title: "Age (Years)",
                      controller: TextEditingController(),
                      hintText: "05",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
