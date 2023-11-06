import 'package:assignment_realtime_innovations/core/app_colors.dart';
import 'package:assignment_realtime_innovations/features/employee_list/get_controllers/employee_list_get_controller.dart';
import 'package:assignment_realtime_innovations/helpers/date_time_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';

import '../../../models/employee_model.dart';
import '../../add_employee_details/ui/add_employee_details_screen.dart';
import '../../edit_employee_details/ui/edit_employee_details_screen.dart';

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
                                .where((p0) => p0.currentEmployee)
                                .toList()[index];
                            return Dismissible(
                              key: Key(employee.employeeName),
                              background: Container(),
                              secondaryBackground: Container(
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.all(16.0.dp),
                                  child: Icon(
                                    Icons.delete,
                                    size: 24.dp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => EditEmployeeDetailsScreen(
                                        employeeModel: employee,
                                      ));
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.0.dp, vertical: 4.dp),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        employee.employeeName,
                                        style: TextStyle(
                                            fontSize: 18.dp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 4.dp,
                                      ),
                                      Text(
                                        employee.role,
                                        style: TextStyle(
                                            fontSize: 14.dp,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        height: 4.dp,
                                      ),
                                      SizedBox(
                                        height: 4.dp,
                                      ),
                                      Text(
                                        "From ${employee.fromDate.getDateWithShortMonthName}",
                                        style: TextStyle(
                                            fontSize: 12.dp,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              confirmDismiss: (direction) async {
                                if (direction == DismissDirection.endToStart) {
                                  return await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Confirm"),
                                        content: const Text(
                                            "Are you sure you wish to delete this item?"),
                                        actions: <Widget>[
                                          TextButton(
                                              onPressed: () {
                                                controller
                                                    .deleteEmployee(employee)
                                                    .then((value) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: const Text(
                                                              'Employee data has been deleted'),
                                                          action:
                                                              SnackBarAction(
                                                            label: 'UNDO',
                                                            onPressed: () {
                                                              controller
                                                                  .saveEmployeeDetails(
                                                                      employee)
                                                                  .then(
                                                                      (value) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .hideCurrentSnackBar();
                                                              });
                                                            },
                                                          )));
                                                });
                                                Navigator.of(context).pop(true);
                                              },
                                              child: const Text("DELETE")),
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.of(context)
                                                    .pop(false),
                                            child: const Text("CANCEL"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                                return false;
                              },
                            );
                          },
                          itemCount: controller.employeeList
                              .where((p0) => p0.currentEmployee)
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
                            'Previous  Employees',
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
                            EmployeeModel employee = controller.employeeList
                                .where((p0) => !p0.currentEmployee)
                                .toList()[index];
                            return Dismissible(
                                key: Key(employee.employeeName),
                                background: Container(),
                                secondaryBackground: Container(
                                  color: Colors.red,
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0.dp),
                                    child: Icon(
                                      Icons.delete,
                                      size: 24.dp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                /*onDismissed: (direction) {
                                if (direction == DismissDirection.endToStart) {
                                  controller.deleteEmployee(employee);
                                }
                              },*/
                                confirmDismiss: (direction) async {
                                  if (direction ==
                                      DismissDirection.endToStart) {
                                    return await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text("Confirm"),
                                          content: const Text(
                                              "Are you sure you wish to delete this item?"),
                                          actions: <Widget>[
                                            TextButton(
                                                onPressed: () {
                                                  controller
                                                      .deleteEmployee(employee)
                                                      .then((value) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content: const Text(
                                                                'Employee data has been deleted'),
                                                            action:
                                                                SnackBarAction(
                                                              label: 'UNDO',
                                                              onPressed: () {
                                                                controller
                                                                    .saveEmployeeDetails(
                                                                        employee)
                                                                    .then(
                                                                        (value) {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .hideCurrentSnackBar();
                                                                });
                                                              },
                                                            )));
                                                  });
                                                  Navigator.of(context)
                                                      .pop(true);
                                                },
                                                child: const Text("DELETE")),
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.of(context)
                                                      .pop(false),
                                              child: const Text("CANCEL"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                  return false;
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => EditEmployeeDetailsScreen(
                                          employeeModel: employee,
                                        ));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.0.dp, vertical: 4.dp),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          employee.employeeName,
                                          style: TextStyle(
                                              fontSize: 18.dp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 4.dp,
                                        ),
                                        Text(
                                          employee.role,
                                          style: TextStyle(
                                              fontSize: 14.dp,
                                              color: Colors.grey),
                                        ),
                                        SizedBox(
                                          height: 4.dp,
                                        ),
                                        Text(
                                          "${employee.fromDate.getDateWithShortMonthName} - ${employee.toDate.getDateWithShortMonthName}",
                                          style: TextStyle(
                                              fontSize: 12.dp,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                          },
                          itemCount: controller.employeeList
                              .where((p0) => !p0.currentEmployee)
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
