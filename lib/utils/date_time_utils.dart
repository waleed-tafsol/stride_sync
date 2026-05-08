import 'package:intl/intl.dart';

extension DateTimeUtils on DateTime {
  String get longMonth {
    return DateFormat('MMMM').format(this);
  }

  String get shortWeekDay {
    return DateFormat('EEE').format(this);
  }

  String get monthYear {
    return DateFormat('MMM yyyy').format(this);
  }

  String get time24Hours {
    return DateFormat('HH:mm').format(this);
  }
}
