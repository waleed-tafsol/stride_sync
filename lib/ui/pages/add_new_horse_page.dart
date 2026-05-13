import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stride_sync/constant/assets.dart';
import 'package:stride_sync/ui/resources/app_colors.dart';
import 'package:stride_sync/ui/resources/app_fonts.dart';
import 'package:stride_sync/ui/widgets/app_back_button.dart';
import 'package:stride_sync/ui/widgets/app_drop_down.dart';
import 'package:stride_sync/ui/widgets/custom_app_bar.dart';
import 'package:stride_sync/ui/widgets/gradient_button.dart';
import 'package:stride_sync/ui/widgets/image_selection_bottom_sheet.dart';
import 'package:stride_sync/ui/widgets/text_form_field_with_title_widget.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

class AddNewHorsePage extends StatefulWidget {
  static const String routeName = '/add-new-horse';

  const AddNewHorsePage({super.key});

  @override
  State<AddNewHorsePage> createState() => _AddNewHorsePageState();
}

class _AddNewHorsePageState extends State<AddNewHorsePage> {
  final TextEditingController _dobController = TextEditingController();
  DateTime? _selectedDate;
  XFile? _selectedHorseImage;

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.secondary,
              onPrimary: AppColors.white,
              onSurface: AppColors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: AppColors.secondary),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // Format: dd/mm/yyyy
        _dobController.text =
            '${picked.day.toString().padLeft(2, '0')}/'
            '${picked.month.toString().padLeft(2, '0')}/'
            '${picked.year}';
      });
    }
  }

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
                onTap: () async {
                  final file = await ImageSelectionBottomSheet.show(
                    context: context,
                  );

                  if (file != null) {
                    setState(() {
                      _selectedHorseImage = file;
                    });
                  }
                },
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
                      image: DecorationImage(
                        image: _selectedHorseImage != null
                            ? FileImage(File(_selectedHorseImage!.path))
                            : const AssetImage(DummyAssets.horseDetail)
                                  as ImageProvider,
                        fit: BoxFit.cover,
                        opacity: _selectedHorseImage != null ? 1 : 0.4,
                      ),
                    ),
                    child: _selectedHorseImage != null
                        ? const SizedBox.shrink()
                        : Column(
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
                              Text(
                                "Upload Horse Photo",
                                style: AppFonts.black20w700,
                              ),
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
                      title: "Registration Name",
                      controller: TextEditingController(),
                      hintText: "Enter Registration Name",
                    ),
                    TextFormFieldWithTitleWidget(
                      title: "Barn Name",
                      controller: TextEditingController(),
                      hintText: "Enter Barn Name",
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
                    SizedBox(height: 20),
                    Text("Date of birth", style: AppFonts.grey18w400),
                    SizedBox(height: 20.h),
                    TextFormField(
                      controller: _dobController,
                      readOnly: true,
                      onTap: _pickDate,
                      decoration: InputDecoration(
                        hintText: "dd/mm/yyyy",
                        suffixIcon: Icon(
                          TablerIcons.calendar,
                          color: AppColors.secondary,
                          size: 24.sp,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),

                    CustomDropdown(
                      label: 'Gender',
                      hint: 'Select Gender',
                      options: ['Stallion', 'Gelding', 'Mare'],
                      onChanged: (value) {},
                    ),

                    TextFormFieldWithTitleWidget(
                      title: "Color",
                      controller: TextEditingController(),
                      hintText: "Bay",
                    ),
                    SizedBox(height: 20.h),

                    CustomDropdown(
                      label: 'Owner',
                      hint: 'Select Owner',
                      options: ['Option 1', 'Option 2', 'Option 3'],
                      onChanged: (value) {},
                    ),
                    TextFormFieldWithTitleWidget(
                      title: "Forage/Frequency",
                      controller: TextEditingController(),
                      hintText: "Free choice",
                    ),
                    TextFormFieldWithTitleWidget(
                      title: "Grain/Frequency",
                      controller: TextEditingController(),
                      hintText: "Purina strategy",
                    ),
                    TextFormFieldWithTitleWidget(
                      title: "Supplement/Frequency",
                      controller: TextEditingController(),
                      hintText: "Joint supplement",
                    ),
                    TextFormFieldWithTitleWidget(
                      title: "Medication/Frequency",
                      controller: TextEditingController(),
                      hintText: "None",
                    ),
                    TextFormFieldWithTitleWidget(
                      title: "Health Status Notes",
                      maxLines: 4,
                      controller: TextEditingController(),
                      hintText:
                          "Any specific health requirements or recent medical history...",
                    ),
                    SizedBox(height: 20.h),

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
                          padding: EdgeInsets.all(16.w),

                          width: double.infinity,

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
                                  TablerIcons.cloudUpload,
                                  size: 22.sp,
                                  color: AppColors.white,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                mainAxisAlignment: .center,
                                children: [
                                  Text(
                                    "Click to upload",
                                    style: AppFonts.black14w600,
                                  ),
                                  Text(
                                    " Documents",
                                    style: AppFonts.grey14w400,
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                "SVG, PNG, or PDF (max 10MB)",
                                style: AppFonts.grey12w400,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          decoration: const BoxDecoration(color: Colors.white),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 50.h,
                    alignment: Alignment.center,
                    child: Text("Cancel", style: AppFonts.brown16w500),
                  ),
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: SizedBox(
                  height: 50.h,
                  child: GradientButton(
                    text: 'Save Horse',
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
