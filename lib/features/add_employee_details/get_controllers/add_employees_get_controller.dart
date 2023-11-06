import 'package:assignment_realtime_innovations/core/app_constants.dart';
import 'package:assignment_realtime_innovations/features/employee_list/get_controllers/employee_list_get_controller.dart';
import 'package:assignment_realtime_innovations/models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class AddEmployeesGetController extends GetxController {
  TextEditingController employeeNameController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

  Future<void> saveEmployeeDetails() async {
    EmployeeModel employeeModelHive = EmployeeModel(
        id: DateTime.now().millisecondsSinceEpoch,
        employeeName: employeeNameController.text,
        role: roleController.text,
        fromDate: fromDate,
        toDate: toDate,
        currentEmployee: toDateController.text.isEmpty);

    var box = await Hive.openBox<EmployeeModel>(AppConstants.employeeTable);
    box.add(employeeModelHive);
    EmployeeListGetController employeeListGetController =
        Get.find<EmployeeListGetController>();

    await employeeListGetController.getEmployeeList();
    Get.back();
    Get.snackbar('Success', 'Employee details saved successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white);
  }

  @override
  void onClose() {
    Hive.box<EmployeeModel>(AppConstants.employeeTable).close();
    super.onClose();
  }
}
