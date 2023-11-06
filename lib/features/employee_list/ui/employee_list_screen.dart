import 'package:assignment_realtime_innovations/core/app_colors.dart';
import 'package:assignment_realtime_innovations/features/employee_list/get_controllers/employee_list_get_controller.dart';
import 'package:assignment_realtime_innovations/helpers/date_time_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';

import '../../../models/employee_model.dart';
import '../../add_employee_details/ui/add_employee_details_screen.dart';

class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
        elevation: 0,
      ),
      body: GetX<EmployeeListGetController>(
          init: EmployeeListGetController(),
          builder: (controller) {
            return controller.employeeList.isNotEmpty
                ? Column(
                    children: [
                      Container(
                        color: Colors.grey.shade200.withOpacity(0.5),
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(8.0.dp),
                        child: Padding(
                          padding: EdgeInsets.all(8.0.dp),
                          child: Text(
                            'Current Employees',
                            style: TextStyle(
                                fontSize: 18.dp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            var employee = controller.employeeList
                                .where((p0) => p0.toDate == null)
                                .toList()[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0.dp, vertical: 4.dp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    employee.employeeName,
                                    style: TextStyle(
                                        fontSize: 18.dp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 2.dp,
                                  ),
                                  Text(
                                    employee.role,
                                    style: TextStyle(
                                        fontSize: 14.dp, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 2.dp,
                                  ),
                                  SizedBox(
                                    height: 2.dp,
                                  ),
                                  Text(
                                    "From ${employee.fromDate.getDateWithShortMonthName}",
                                    style: TextStyle(
                                        fontSize: 14.dp, color: Colors.grey),
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: controller.employeeList
                              .where((p0) => p0.toDate == null)
                              .length,
                        ),
                      ),
                      Container(
                        color: Colors.grey.shade200.withOpacity(0.5),
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(8.0.dp),
                        child: Padding(
                          padding: EdgeInsets.all(8.0.dp),
                          child: Text(
                            'Current Employees',
                            style: TextStyle(
                                fontSize: 18.dp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            EmployeeModelHive employee = controller.employeeList
                                .where((p0) => p0.toDate != null)
                                .toList()[index];
                            return Dismissible(
                              key: Key(employee.employeeName),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0.dp, vertical: 4.dp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      employee.employeeName,
                                      style: TextStyle(
                                          fontSize: 18.dp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 2.dp,
                                    ),
                                    Text(
                                      employee.role,
                                      style: TextStyle(
                                          fontSize: 14.dp, color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 2.dp,
                                    ),
                                    Text(
                                      "${employee.fromDate.getDateWithShortMonthName} - ${employee.toDate!.getDateWithShortMonthName}",
                                      style: TextStyle(
                                          fontSize: 14.dp, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              secondaryBackground: Container(
                                color: Colors.red,
                                child: Icon(
                                  Icons.delete,
                                  size: 24.dp,
                                  color: Colors.white,
                                ),
                              ),
                              background: Container(
                                color: Colors.red,
                                child: Icon(
                                  Icons.delete,
                                  size: 24.dp,
                                  color: Colors.white,
                                ),
                              ),
                              onDismissed: (direction) {},
                            );
                          },
                          itemCount: controller.employeeList
                              .where((p0) => p0.toDate != null)
                              .length,
                        ),
                      ),
                      Container(
                        height: 10.h,
                        color: Colors.grey.shade200.withOpacity(0.5),
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0.dp),
                          child: Text(
                            'Swipe Left to Delete',
                            style: TextStyle(
                                fontSize: 16.dp,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Image.asset('assets/images/Group 5367.png',
                        width: 70.w),
                  );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => AddEmployeeDetailsScreen());
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.dp),
          ),
          child: const Icon(Icons.add)),
    );
  }
}
