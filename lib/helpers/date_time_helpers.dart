extension DateTimeHelpers on DateTime {
  String get getMonthName {
    Map<int, String> monthNames = {
      1: 'January',
      2: 'February',
      3: 'March',
      4: 'April',
      5: 'May',
      6: 'June',
      7: 'July',
      8: 'August',
      9: 'September',
      10: 'October',
      11: 'November',
      12: 'December'
    };
    return monthNames[month]!;
  }

  String get dayOfWeek {
    Map<int, String> daysOfWeek = {
      1: 'Mon',
      2: 'Tue',
      3: 'Wed',
      4: 'Thu',
      5: 'Fri',
      6: 'Sat',
      7: 'Sun'
    };
    return daysOfWeek[weekday]!;
  }

  List<String> get getMonthDays {
    var days = <String>[];
    var firstDay = DateTime(year, month, 1);
    var lastDay = DateTime(year, month + 1, 0);
    for (var i = 0; i < lastDay.day; i++) {
      days.add(DateTime(year, month, i + 1).dayOfWeek);
    }
    return days;
  }

  String get getDateWithShortMonthName {
    Map<int, String> monthNames = {
      1: 'Jan',
      2: 'Feb',
      3: 'Mar',
      4: 'Apr',
      5: 'May',
      6: 'Jun',
      7: 'July',
      8: 'Aug',
      9: 'Sept',
      10: 'Oct',
      11: 'Nov',
      12: 'Dec'
    };
    return '$day ${monthNames[month]} $year';
  }
}
