import 'package:assignment_realtime_innovations/core/app_colors.dart';
import 'package:assignment_realtime_innovations/helpers/date_time_helpers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomDatePicker extends StatefulWidget {
  final Function(DateTime?) onDateSelected;
  final bool noDateOption;

  CustomDatePicker({
    required this.onDateSelected,
    Key? key,
    this.noDateOption = false,
  }) : super(key: key);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime _selectedDate = DateTime.now();
  bool datePicked = false;

  int buttonClicked = 0;

  @override
  void initState() {
    datePicked = !widget.noDateOption;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.dp),
      child: Wrap(
        children: [
          !widget.noDateOption
              ? Table(
                  children: [
                    TableRow(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.dp),
                        child: ElevatedButton(
                            style: buttonClicked == 0
                                ? null
                                : ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary.shade50
                                        .withOpacity(0.5),
                                    foregroundColor: AppColors.primary,
                                    elevation: 0),
                            onPressed: () {
                              setState(() {
                                _selectedDate = DateTime.now();
                                datePicked = true;
                                buttonClicked = 0;
                              });
                            },
                            child: Text('Today')),
                      )),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0.dp),
                        child: ElevatedButton(
                            style: buttonClicked == 1
                                ? null
                                : ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary.shade50
                                        .withOpacity(0.5),
                                    foregroundColor: AppColors.primary,
                                    elevation: 0),
                            onPressed: () {
                              int currentWeekday = _selectedDate.weekday;
                              int daysToAdd = 0;
                              if (currentWeekday == DateTime.monday) {
                                daysToAdd = 6;
                              } else if (currentWeekday == DateTime.tuesday) {
                                daysToAdd = 5;
                              } else if (currentWeekday == DateTime.wednesday) {
                                daysToAdd = 4;
                              } else if (currentWeekday == DateTime.thursday) {
                                daysToAdd = 3;
                              } else if (currentWeekday == DateTime.friday) {
                                daysToAdd = 2;
                              } else if (currentWeekday == DateTime.saturday) {
                                daysToAdd = 1;
                              } else if (currentWeekday == DateTime.sunday) {
                                daysToAdd = 0;
                              }
                              DateTime nextMonday =
                                  _selectedDate.add(Duration(days: daysToAdd));
                              setState(() {
                                _selectedDate =
                                    nextMonday.add(Duration(days: 1));
                                buttonClicked = 1;
                                datePicked = true;
                              });
                            },
                            child: Text('Next Monday')),
                      )),
                    ]),
                    TableRow(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.dp),
                        child: ElevatedButton(
                            style: buttonClicked == 2
                                ? null
                                : ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary.shade50
                                        .withOpacity(0.5),
                                    foregroundColor: AppColors.primary,
                                    elevation: 0),
                            onPressed: () {
                              int currentWeekday = _selectedDate.weekday;
                              int daysToAdd = 0;
                              if (currentWeekday == DateTime.monday) {
                                daysToAdd = 1;
                              } else if (currentWeekday == DateTime.tuesday) {
                                daysToAdd = 0;
                              } else if (currentWeekday == DateTime.wednesday) {
                                daysToAdd = 6;
                              } else if (currentWeekday == DateTime.thursday) {
                                daysToAdd = 5;
                              } else if (currentWeekday == DateTime.friday) {
                                daysToAdd = 4;
                              } else if (currentWeekday == DateTime.saturday) {
                                daysToAdd = 3;
                              } else if (currentWeekday == DateTime.sunday) {
                                daysToAdd = 2;
                              }
                              DateTime nextTuesday =
                                  _selectedDate.add(Duration(days: daysToAdd));
                              setState(() {
                                _selectedDate = nextTuesday;
                                buttonClicked = 2;
                                datePicked = true;
                              });
                            },
                            child: Text('Next Tuesday')),
                      )),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0.dp),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    AppColors.primary.shade50.withOpacity(0.5),
                                foregroundColor: AppColors.primary,
                                elevation: 0),
                            onPressed: () {
                              DateTime nextWeek =
                                  _selectedDate.add(Duration(days: 7));
                              setState(() {
                                _selectedDate = nextWeek;
                                buttonClicked = 3;
                                datePicked = true;
                              });
                            },
                            child: Text('After 1 Week')),
                      )),
                    ]),
                  ],
                )
              : Table(
                  children: [
                    TableRow(children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.dp),
                        child: ElevatedButton(
                            style: buttonClicked == 0
                                ? null
                                : ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary.shade50
                                        .withOpacity(0.5),
                                    foregroundColor: AppColors.primary,
                                    elevation: 0),
                            onPressed: () {
                              setState(() {
                                _selectedDate = DateTime.now();
                                buttonClicked = 0;
                                datePicked = false;
                              });
                            },
                            child: Text('No Date')),
                      )),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.dp),
                        child: ElevatedButton(
                            style: buttonClicked == 1
                                ? null
                                : ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary.shade50
                                        .withOpacity(0.5),
                                    foregroundColor: AppColors.primary,
                                    elevation: 0),
                            onPressed: () {
                              setState(() {
                                _selectedDate = DateTime.now();
                                buttonClicked = 1;
                                datePicked = true;
                              });
                            },
                            child: Text('Today')),
                      )),
                    ]),
                  ],
                ),
          SizedBox(height: 16.dp),
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _selectedDate,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDate, day);
            },
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: AppColors.primary.shade50,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              titleTextStyle: TextStyle(
                fontSize: 16.dp,
                fontWeight: FontWeight.bold,
              ),
            ),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDate = selectedDay;
              });
            },
          ),
          SizedBox(height: 16.dp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_month, color: AppColors.primary),
                  SizedBox(width: 8.dp),
                  Text(_selectedDate.getDateWithShortMonthName,
                      style: TextStyle(
                        fontSize: 16.dp,
                      )),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppColors.primary.shade50.withOpacity(0.5),
                          foregroundColor: AppColors.primary,
                          elevation: 0),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel')),
                  SizedBox(width: 8.dp),
                  ElevatedButton(
                      onPressed: () {
                        widget
                            .onDateSelected(datePicked ? _selectedDate : null);
                        Navigator.of(context).pop();
                      },
                      child: Text('Save')),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
