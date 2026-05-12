import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sync Calendar',
                style: AppFonts.black20w700.copyWith(letterSpacing: -0.64),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: _buildSyncButton(
                      'Google Calendar',
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Google_Calendar_icon_%282020%29.svg/1024px-Google_Calendar_icon_%282020%29.svg.png',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildSyncButton(
                      'Apple Calendar',
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Apple_Calendar_icon.svg/1024px-Apple_Calendar_icon.svg.png',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.borderColor, width: 1),
                ),
                padding: const EdgeInsets.all(12),
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
                    todayDecoration: BoxDecoration(
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
                    defaultTextStyle: const TextStyle(fontFamily: AppFonts.fontFamily),
                    weekendTextStyle: const TextStyle(fontFamily: AppFonts.fontFamily),
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: false,
                    titleTextStyle: AppFonts.black20w700,
                    leftChevronIcon: const Icon(Icons.chevron_left, color: AppColors.borderColor),
                    rightChevronIcon: const Icon(Icons.chevron_right, color: AppColors.borderColor),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: AppFonts.grey16w400.copyWith(fontSize: 12),
                    weekendStyle: AppFonts.grey16w400.copyWith(fontSize: 12),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                _selectedDay != null
                    ? DateFormat('EEEE, MMM d').format(_selectedDay!)
                    : 'Select a date',
                style: AppFonts.black20w700.copyWith(letterSpacing: -0.64),
              ),
              const SizedBox(height: 20),
              ..._getEventsForDay(_selectedDay ?? _focusedDay).map((event) => _buildEventItem(event)).toList(),
              const SizedBox(height: 80), // Space for FAB
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, AddEventScreen.routeName);
          },
          child: SvgPicture.asset(SvgAssets.floatingBtn)),
    );
  }

  Widget _buildSyncButton(String title, String imageUrl) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.textFeildBorder, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(imageUrl, width: 24, height: 24, errorBuilder: (c, e, s) => const Icon(Icons.calendar_month, size: 24)),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppFonts.black16w400.copyWith(
                fontWeight: FontWeight.w500,
                letterSpacing: -0.80,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventItem(Event event) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Event Image/Time Block
          Container(
            width: 78,
            height: 100,
            decoration: const BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Image.asset(
               DummyAssets.horse,
                fit: BoxFit.cover,
                errorBuilder: (c, e, s) => const Center(child: Icon(Icons.event, color: AppColors.white)),
              ),
            ),
          ),
          // Event Details
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.fillColor,
                border: Border.all(color: AppColors.borderColor.withOpacity(0.5)),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
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
                          style: AppFonts.black14w400.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: event.typeColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          event.type,
                          style: TextStyle(
                            color: event.textColor,
                            fontSize: 10,
                            fontFamily: AppFonts.fontFamily,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 12, color: AppColors.textGrey),
                      const SizedBox(width: 4),
                      Text(
                        event.time,
                        style: AppFonts.grey10w400,
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.location_on_outlined, size: 12, color: AppColors.textGrey),
                      const SizedBox(width: 4),
                      Text(
                        event.location,
                        style: AppFonts.grey10w400,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.brown,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      event.horseName,
                      style: AppFonts.brown10w400,
                    ),
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