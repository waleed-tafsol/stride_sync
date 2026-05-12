import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stride_sync/constant/assets.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/text_form_field_with_title_widget.dart';

class AddEventScreen extends StatefulWidget {
  static const String routeName = '/add-event-screen';

  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  int selectedIndex = 0;

  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  bool isMultiDay = false;
  bool reminder = false;


  final List<String> users = ['Galileo', 'Newton', 'Einstein'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingWidget: Container(
          height: 32.h,
          width: 32.h,
          padding: EdgeInsets.all(6.w),
          decoration: BoxDecoration(
            color: AppColors.containerGrey,
            borderRadius: BorderRadius.circular(12.sp),
            border: Border.all(color: AppColors.containerBorder),
          ),
          child: Icon(Icons.arrow_back, size: 20.sp),
        ),
        title: 'Add New Event',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 16.w,
                  ),
                  color: AppColors.white,
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      TextFormFieldWithTitleWidget(
                        title: 'Event Title',
                        controller: TextEditingController(),
                        hintText: "e.g., Morning Dressage",
                      ),
                      SizedBox(height: 20.h),
                      eventTypeWidget(),
                      TextFormFieldWithTitleWidget(
                        title: 'Location',
                        controller: TextEditingController(),
                        hintText: "Arena A",
                        suffixIcon: Icons.location_on_outlined,
                      ),
                      SizedBox(height: 20.h),
                      multiDayEventWidget(),
                      SizedBox(height: 20.h),
                      Text(
                        'Assigned Horse',
                        style: AppFonts.grey18w400,
                        textAlign: .start,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 20.h),
                      selectHorseWidget(),
                      SizedBox(height: 20.h),
                      dateTimeWidget(),
                      TextFormFieldWithTitleWidget(
                        maxLines: 4,
                        title: 'Notes & Description',
                        controller: TextEditingController(),
                        hintText:
                            "Enter activity details, special instructions, or vet requirements...",
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Reminder',
                        style: AppFonts.grey18w400,
                        textAlign: .start,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 20.h),
                      reminderWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dateTimeWidget() {
    return Row(
      spacing: 20.w,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date',
                style: AppFonts.grey18w400,
                textAlign: .start,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 20.h),
              TextFormField(
                controller: dateController,
                readOnly: true,
                onTap: ()async{
                  FocusScope.of(context).unfocus();
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  if (pickedDate != null) {
                    dateController.text =
                    "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  }
                },
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  hintText:"Arena A",
                  suffixIcon: Icon(TablerIcons.calendarDue, color: AppColors.secondary, size: 24.sp)

                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Time',
                style: AppFonts.grey18w400,
                textAlign: .start,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 20.h),
              TextFormField(
                controller: timeController,
                readOnly: true,
                onTap: ()async{
                  FocusScope.of(context).unfocus();

                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (pickedTime != null) {
                    timeController.text = pickedTime.format(context);
                  }

                },
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                    hintText:"08:30 AM",
                    suffixIcon: Icon(TablerIcons.historyToggle, color: AppColors.secondary, size: 24.sp)

                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget selectHorseWidget() {
    return SizedBox(
      height: 90.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: users.length + 1,
        separatorBuilder: (_, __) => SizedBox(width: 10.w),
        itemBuilder: (context, index) {
          final isOther = index == users.length;
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Column(
              children: [
                Container(
                  height: 64.h,
                  width: 64.w,
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? AppColors.black
                          : isOther
                          ? AppColors.containerGrey
                          : Colors.transparent,
                    ),
                  ),
                  child: isOther
                      ? Icon(Icons.add, size: 28.sp)
                      : ColorFiltered(
                          colorFilter: isSelected
                              ? const ColorFilter.mode(
                                  Colors.transparent,
                                  BlendMode.multiply,
                                )
                              : ColorFilter.mode(
                                  Colors.white.withOpacity(0.5),
                                  BlendMode.modulate,
                                ),
                          child: Image.asset(DummyAssets.horse),
                        ),
                ),
                SizedBox(height: 8.h),
                Text(
                  isOther ? 'Other' : users[index],
                  style: AppFonts.black12w600,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget multiDayEventWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Multi-day Event',
          style: AppFonts.grey18w400,
          textAlign: .start,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 20.h),
        TextFormField(
          controller: TextEditingController(text:  isMultiDay ? "Yes" : "No",),
          readOnly: true,
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
          decoration: InputDecoration(
            hintText: "Multi-day Event",
            suffixIcon: Transform.scale(
              scale: 0.75,
              child: Switch(
                value: isMultiDay,
                onChanged: (value) {
                  setState(() {
                    isMultiDay = value;
                  });
                },
                activeColor: AppColors.secondary,
              ),
            ),
          ),
        )
      ],
    );
  }


  Widget eventTypeWidget() {
    final List<String> eventTypes = [
      "Meeting",
      "Conference",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Event Type',
          style: AppFonts.grey18w400,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 20.h),

        DropdownButtonFormField2<String>(
          isExpanded: true,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.zero,
            hintText: "Select Event",
          ),

          hint: Text(
            "Select Event",
            style: AppFonts.grey18w400,
          ),

          items: eventTypes
              .map(
                (item) => DropdownItem<String>(
              value: item,
              child: Text(
                item,
                style: AppFonts.black14w400,
              ),
            ),
          )
              .toList(),

          onChanged: (value) {
            // handle selection
          },

          iconStyleData: const IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down),
            iconSize: 24,
          ),

          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
      ],
    );
  }
  Widget reminderWidget() {
    return Container(
      width: double.infinity,
      padding:  EdgeInsets.all(12.w),
      decoration: ShapeDecoration(
        color: AppColors.containerGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: const Color(0xFFE4E2DD),
              borderRadius: BorderRadius.circular(12),
            ),
            child:  Icon(
              Icons.notifications_none,
              size: 24.sp,
              color: AppColors.secondary,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Set Reminder",
                  style: AppFonts.black14w400,
                ),
                const SizedBox(height: 3),
                Text(
                  "Notify 1 hour before event",
                  style: AppFonts.grey10w400,
                ),
              ],
            ),
          ),

          // Toggle Switch (custom UI from Figma)
          Transform.scale(
            scale: 0.75,
            child: Switch(
              value: reminder,
              onChanged: (value) {
                setState(() {
                  reminder = !reminder;

                });
              },
              activeColor: AppColors.secondary,
            ),
          )
        ],
      ),
    );
  }



}
