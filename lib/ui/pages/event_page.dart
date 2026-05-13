import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stride_sync/constant/assets.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../widgets/custom_app_bar.dart';
import 'add_event_screen.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final Map<DateTime, List<Event>> _events = {
    DateTime.utc(2026, 05, 12): [
      Event(
        title: 'Daily Training Session',
        time: '09:00 AM - 10:30 AM',
        location: 'Arena A',
        horseName: 'Starlight',
        type: 'Training',
        typeColor: AppColors.lightBrown2,
        textColor: AppColors.secondary,
        horseImg: DummyAssets.horse,
      ),
      Event(
        title: 'Veterinary Checkup',
        time: '02:00 PM - 03:00 PM',
        location: 'Main Stable',
        horseName: 'Midnight',
        type: 'Health',
        typeColor: AppColors.lightBrown2,
        textColor: AppColors.secondary,
        horseImg: DummyAssets.horse1,
      ),
      Event(
        title: 'Farrier Appointment',
        time: '04:30 PM',
        location: 'Workshop',
        horseName: 'Golden Mane',
        type: 'Maintenance',
        typeColor: AppColors.lightBrown2,
        textColor: AppColors.secondary,
        horseImg: DummyAssets.horse2,
      ),
    ],
    DateTime.utc(2026, 05, 14): [
      Event(
        title: 'Daily Training Session',
        time: '09:00 AM - 10:30 AM',
        location: 'Arena A',
        horseName: 'Starlight',
        type: 'Training',
        typeColor: AppColors.lightBrown2,
        textColor: AppColors.secondary,
        horseImg: DummyAssets.horse,
      ),
      Event(
        title: 'Veterinary Checkup',
        time: '02:00 PM - 03:00 PM',
        location: 'Main Stable',
        horseName: 'Midnight',
        type: 'Health',
        typeColor: AppColors.lightBrown2,
        textColor: AppColors.secondary,
        horseImg: DummyAssets.horse1,
      ),
      Event(
        title: 'Farrier Appointment',
        time: '04:30 PM',
        location: 'Workshop',
        horseName: 'Golden Mane',
        type: 'Maintenance',
        typeColor: AppColors.lightBrown2,
        textColor: AppColors.secondary,
        horseImg: DummyAssets.horse2,
      ),
    ],
    DateTime.utc(2026, 05, 16): [
      Event(
        title: 'Daily Training Session',
        time: '09:00 AM - 10:30 AM',
        location: 'Arena A',
        horseName: 'Starlight',
        type: 'Training',
        typeColor: AppColors.lightBrown2,
        textColor: AppColors.secondary,
        horseImg: DummyAssets.horse,
      ),
      Event(
        title: 'Farrier Appointment',
        time: '04:30 PM',
        location: 'Workshop',
        horseName: 'Golden Mane',
        type: 'Maintenance',
        typeColor: AppColors.lightBrown2,
        textColor: AppColors.secondary,
        horseImg: DummyAssets.horse2,
      ),
      Event(
        title: 'Farrier Appointment',
        time: '04:30 PM',
        location: 'Workshop',
        horseName: 'Golden Mane',
        type: 'Maintenance',
        typeColor: AppColors.lightBrown2,
        textColor: AppColors.secondary,
        horseImg: DummyAssets.horse2,
      ),
      Event(
        title: 'Farrier Appointment',
        time: '04:30 PM',
        location: 'Workshop',
        horseName: 'Golden Mane',
        type: 'Maintenance',
        typeColor: AppColors.lightBrown2,
        textColor: AppColors.secondary,
        horseImg: DummyAssets.horse2,
      ),
    ],
    DateTime.utc(2026, 05, 17): [
      Event(
        title: 'Daily Training Session',
        time: '09:00 AM - 10:30 AM',
        location: 'Arena A',
        horseName: 'Starlight',
        type: 'Training',
        typeColor: AppColors.lightBrown2,
        textColor: AppColors.secondary,
        horseImg: DummyAssets.horse,
      ),
      Event(
        title: 'Veterinary Checkup',
        time: '02:00 PM - 03:00 PM',
        location: 'Main Stable',
        horseName: 'Midnight',
        type: 'Health',
        typeColor: AppColors.lightBrown2,
        textColor: AppColors.secondary,
        horseImg: DummyAssets.horse1,
      ),
      Event(
        title: 'Farrier Appointment',
        time: '04:30 PM',
        location: 'Workshop',
        horseName: 'Golden Mane',
        type: 'Maintenance',
        typeColor: AppColors.lightBrown2,
        textColor: AppColors.secondary,
        horseImg: DummyAssets.horse2,
      ),
    ],
    DateTime.utc(2026, 05, 19): [
      Event(
        title: 'Daily Training Session',
        time: '09:00 AM - 10:30 AM',
        location: 'Arena A',
        horseName: 'Starlight',
        type: 'Training',
        typeColor: AppColors.lightBrown2,
        textColor: AppColors.secondary,
        horseImg: DummyAssets.horse,
      ),
      Event(
        title: 'Veterinary Checkup',
        time: '02:00 PM - 03:00 PM',
        location: 'Main Stable',
        horseName: 'Midnight',
        type: 'Health',
        typeColor: AppColors.lightBrown2,
        textColor: AppColors.secondary,
        horseImg: DummyAssets.horse1,
      ),
      Event(
        title: 'Farrier Appointment',
        time: '04:30 PM',
        location: 'Workshop',
        horseName: 'Golden Mane',
        type: 'Maintenance',
        typeColor: AppColors.lightBrown2,
        textColor: AppColors.secondary,
        horseImg: DummyAssets.horse2,
      ),
    ],
    DateTime.utc(2026, 05, 20): [
      Event(
        title: 'Daily Training Session',
        time: '09:00 AM - 10:30 AM',
        location: 'Arena A',
        horseName: 'Starlight',
        type: 'Training',
        typeColor: AppColors.lightBrown2,
        textColor: AppColors.secondary,
        horseImg: DummyAssets.horse,
      ),
      Event(
        title: 'Veterinary Checkup',
        time: '02:00 PM - 03:00 PM',
        location: 'Main Stable',
        horseName: 'Midnight',
        type: 'Health',
        typeColor: AppColors.lightBrown2,
        textColor: AppColors.secondary,
        horseImg: DummyAssets.horse1,
      ),
      Event(
        title: 'Farrier Appointment',
        time: '04:30 PM',
        location: 'Workshop',
        horseName: 'Golden Mane',
        type: 'Maintenance',
        typeColor: AppColors.lightBrown2,
        textColor: AppColors.secondary,
        horseImg: DummyAssets.horse2,
      ),
    ],
  };

  List<Event> _getEventsForDay(DateTime day) {
    return _events[DateTime.utc(day.year, day.month, day.day)] ?? [];
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingWidget: Icon(Icons.menu, size: 30.sp),
        title: 'Events',
        actionIcon: TablerIcons.bell,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sync Calendar',
                style: AppFonts.black20w700.copyWith(letterSpacing: -0.64.sp),
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Expanded(
                    child: _buildSyncButton(
                      'Google Calendar',
                      DummyAssets.googleCalendar,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: _buildSyncButton(
                      'Apple Calendar',
                      DummyAssets.iosCalendar,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.borderColor, width: 1.w),
                ),
                padding: EdgeInsets.all(12.r),
                child: TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  eventLoader: _getEventsForDay,
                  calendarStyle: CalendarStyle(
                    todayDecoration: const BoxDecoration(
                      color: AppColors.lightBrown2,
                      shape: BoxShape.circle,
                    ),
                    todayTextStyle: AppFonts.grey16w400,
                    selectedDecoration: const BoxDecoration(
                      color: AppColors.secondary,
                      shape: BoxShape.circle,
                    ),
                    markerDecoration: const BoxDecoration(
                      color: AppColors.secondary,
                      shape: BoxShape.circle,
                    ),
                    outsideDaysVisible: false,
                    defaultTextStyle: const TextStyle(
                      fontFamily: AppFonts.fontFamily,
                    ),
                    weekendTextStyle: const TextStyle(
                      fontFamily: AppFonts.fontFamily,
                    ),
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: false,
                    titleTextStyle: AppFonts.black20w700,
                    leftChevronIcon: Icon(
                      Icons.chevron_left,
                      color: AppColors.borderColor,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right,
                      color: AppColors.borderColor,
                    ),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: AppFonts.grey16w400.copyWith(fontSize: 12.sp),
                    weekendStyle: AppFonts.grey16w400.copyWith(fontSize: 12.sp),
                  ),
                ),
              ),
              SizedBox(height: 30.h),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      _selectedDay != null
                          ? DateFormat('EEEE, MMM d').format(_selectedDay!)
                          : 'Select a date',
                      style: AppFonts.black20w700.copyWith(
                        letterSpacing: -0.64.sp,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    ..._getEventsForDay(
                      _selectedDay ?? _focusedDay,
                    ).map((event) => _buildEventItem(event)),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AddEventScreen.routeName);
        },
        child: Container(
        height: 50.w,
        width: 50.w,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0x14564336),
              blurRadius: 40.r,
              offset: Offset(0, 20.h),
            ),
          ],
          gradient: AppColors.buttonGradient,
          border: Border.all(color: AppColors.buttonBorder),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            CupertinoIcons.plus,
            size: 30.sp,
            color: AppColors.white,
          ),
        ),
      ),
      ),
    );
  }

  Widget _buildSyncButton(String title, String imageUrl) {
    return Container(
      height: 56.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.fillColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.textFeildBorder, width: 1.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            width: 24.w,
            height: 24.h,
            errorBuilder: (c, e, s) => Icon(Icons.calendar_month, size: 24.sp),
          ),
          SizedBox(width: 10.w),
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppFonts.black16w400.copyWith(
                fontWeight: FontWeight.w500,
                letterSpacing: -0.80.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventItem(Event event) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Event Image/Time Block
          Container(
            width: 78.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
              ),
              child: Image.asset(
                event.horseImg,
                fit: BoxFit.cover,
                height: 100.h,
                errorBuilder: (c, e, s) => Center(
                  child: Icon(Icons.event, color: AppColors.white, size: 24.sp),
                ),
              ),
            ),
          ),
          // Event Details
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12.r),
              height: 100.h,
              decoration: BoxDecoration(
                color: AppColors.fillColor,
                border: Border.all(
                  color: AppColors.borderColor.withValues(alpha: 0.5),
                  width: 1.w,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          event.title,
                          style: AppFonts.black14w400.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: event.typeColor,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Text(
                          event.type,
                          style: TextStyle(
                            color: event.textColor,
                            fontSize: 10.sp,
                            fontFamily: AppFonts.fontFamily,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 12.sp,
                        color: AppColors.textGrey,
                      ),
                      SizedBox(width: 4.w),
                      Text(event.time, style: AppFonts.grey10w400),
                      SizedBox(width: 12.w),
                      Icon(
                        Icons.location_on_outlined,
                        size: 12.sp,
                        color: AppColors.textGrey,
                      ),
                      SizedBox(width: 4.w),
                      Text(event.location, style: AppFonts.grey10w400),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.brown,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Text(event.horseName, style: AppFonts.brown10w400),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Event {
  final String title;
  final String time;
  final String location;
  final String horseName;
  final String horseImg;
  final String type;
  final Color typeColor;
  final Color textColor;

  Event({
    required this.title,
    required this.time,
    required this.location,
    required this.horseName,
    required this.type,
    required this.horseImg,
    required this.typeColor,
    required this.textColor,
  });
}
