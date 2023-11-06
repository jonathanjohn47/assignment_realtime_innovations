import 'package:assignment_realtime_innovations/core/app_colors.dart';
import 'package:assignment_realtime_innovations/helpers/date_time_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import 'get_controllers/custom_date_get_controller.dart';

class CustomDatePicker extends StatelessWidget {
  final Function(DateTime?) onDateSelected;
  final bool noDateOption;

  CustomDatePicker(
      {super.key, required this.onDateSelected, this.noDateOption = false});

  CustomDateGetController getController = Get.put(
    CustomDateGetController(noDateOption: false),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.dp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          !noDateOption
              ? Table(
                  children: [
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.dp),
                        child: Obx(() {
                          return ElevatedButton(
                              style: getController.buttonClicked.value == 0
                                  ? null
                                  : ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary.shade50
                                          .withOpacity(0.5),
                                      foregroundColor: AppColors.primary,
                                      elevation: 0),
                              onPressed: () {
                                getController.selectedDate.value =
                                    DateTime.now();
                                getController.datePicked = true;
                                getController.buttonClicked.value = 0;
                              },
                              child: const Text('Today'));
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0.dp),
                        child: Obx(() {
                          return ElevatedButton(
                              style: getController.buttonClicked.value == 1
                                  ? null
                                  : ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary.shade50
                                          .withOpacity(0.5),
                                      foregroundColor: AppColors.primary,
                                      elevation: 0),
                              onPressed: () {
                                int currentWeekday =
                                    getController.selectedDate.value.weekday;
                                int daysToAdd = 0;
                                if (currentWeekday == DateTime.monday) {
                                  daysToAdd = 6;
                                } else if (currentWeekday == DateTime.tuesday) {
                                  daysToAdd = 5;
                                } else if (currentWeekday ==
                                    DateTime.wednesday) {
                                  daysToAdd = 4;
                                } else if (currentWeekday ==
                                    DateTime.thursday) {
                                  daysToAdd = 3;
                                } else if (currentWeekday == DateTime.friday) {
                                  daysToAdd = 2;
                                } else if (currentWeekday ==
                                    DateTime.saturday) {
                                  daysToAdd = 1;
                                } else if (currentWeekday == DateTime.sunday) {
                                  daysToAdd = 0;
                                }
                                DateTime nextMonday = getController
                                    .selectedDate.value
                                    .add(Duration(days: daysToAdd));

                                getController.selectedDate.value =
                                    nextMonday.add(const Duration(days: 1));
                                getController.buttonClicked.value = 1;
                                getController.datePicked = true;
                              },
                              child: const Text('Next Monday'));
                        }),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.dp),
                        child: Obx(() {
                          return ElevatedButton(
                              style: getController.buttonClicked.value == 2
                                  ? null
                                  : ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary.shade50
                                          .withOpacity(0.5),
                                      foregroundColor: AppColors.primary,
                                      elevation: 0),
                              onPressed: () {
                                int currentWeekday =
                                    getController.selectedDate.value.weekday;
                                int daysToAdd = 0;
                                if (currentWeekday == DateTime.monday) {
                                  daysToAdd = 1;
                                } else if (currentWeekday == DateTime.tuesday) {
                                  daysToAdd = 0;
                                } else if (currentWeekday ==
                                    DateTime.wednesday) {
                                  daysToAdd = 6;
                                } else if (currentWeekday ==
                                    DateTime.thursday) {
                                  daysToAdd = 5;
                                } else if (currentWeekday == DateTime.friday) {
                                  daysToAdd = 4;
                                } else if (currentWeekday ==
                                    DateTime.saturday) {
                                  daysToAdd = 3;
                                } else if (currentWeekday == DateTime.sunday) {
                                  daysToAdd = 2;
                                }
                                DateTime nextTuesday = getController
                                    .selectedDate.value
                                    .add(Duration(days: daysToAdd));
                                getController.selectedDate.value = nextTuesday;
                                getController.buttonClicked.value = 2;
                                getController.datePicked = true;
                              },
                              child: const Text('Next Tuesday'));
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0.dp),
                        child: Obx(() {
                          return ElevatedButton(
                              style: getController.buttonClicked.value == 3
                                  ? null
                                  : ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary.shade50
                                          .withOpacity(0.5),
                                      foregroundColor: AppColors.primary,
                                      elevation: 0),
                              onPressed: () {
                                DateTime nextWeek = getController
                                    .selectedDate.value
                                    .add(const Duration(days: 7));

                                getController.selectedDate.value = nextWeek;
                                getController.buttonClicked.value = 3;
                                getController.datePicked = true;
                              },
                              child: const Text('After 1 Week'));
                        }),
                      ),
                    ]),
                  ],
                )
              : Table(
                  children: [
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.dp),
                        child: Obx(() {
                          return ElevatedButton(
                              style: getController.buttonClicked.value == 0
                                  ? null
                                  : ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary.shade50
                                          .withOpacity(0.5),
                                      foregroundColor: AppColors.primary,
                                      elevation: 0),
                              onPressed: () {
                                getController.selectedDate.value =
                                    DateTime.now();
                                getController.buttonClicked.value = 0;
                                getController.datePicked = false;
                              },
                              child: const Text('No Date'));
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.dp),
                        child: Obx(() {
                          return ElevatedButton(
                              style: getController.buttonClicked.value == 1
                                  ? null
                                  : ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary.shade50
                                          .withOpacity(0.5),
                                      foregroundColor: AppColors.primary,
                                      elevation: 0),
                              onPressed: () {
                                getController.selectedDate.value =
                                    DateTime.now();
                                getController.buttonClicked.value = 1;
                                getController.datePicked = true;
                              },
                              child: const Text('Today'));
                        }),
                      ),
                    ]),
                  ],
                ),
          SizedBox(height: 16.dp),
          Obx(() {
            return TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: getController.selectedDate.value,
              selectedDayPredicate: (day) {
                return isSameDay(getController.selectedDate.value, day);
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
                getController.selectedDate.value = selectedDay;
                getController.datePicked = true;
              },
            );
          }),
          SizedBox(height: 16.dp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_month, color: AppColors.primary),
                  SizedBox(width: 8.dp),
                  Obx(() {
                    return Text(
                        getController
                            .selectedDate.value.getDateWithShortMonthName,
                        style: TextStyle(
                          fontSize: 16.dp,
                        ));
                  }),
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
                        Get.back();
                      },
                      child: const Text('Cancel')),
                  SizedBox(width: 8.dp),
                  ElevatedButton(
                      onPressed: () {
                        onDateSelected(getController.datePicked
                            ? getController.selectedDate.value
                            : null);
                        Get.back();
                      },
                      child: const Text('Save')),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
