import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../core/app_constants.dart';
import '../../../models/employee_model.dart';

class EmployeeListGetController extends GetxController {
  RxList<EmployeeModel> employeeList = <EmployeeModel>[].obs;

  Future<void> getEmployeeList() async {
    var box = await Hive.openBox<EmployeeModel>(AppConstants.employeeTable);
    employeeList.value = box.values.toList();
  }

  @override
  void onInit() {
    getEmployeeList();
    super.onInit();
  }

  @override
  void onClose() {
    Hive.box(AppConstants.employeeTable).close();
    super.onClose();
  }

  Future<void> deleteEmployee(EmployeeModel employee) async {
    // Find the index of the employee to be deleted
    int indexWhere =
        employeeList.indexWhere((element) => element.id == employee.id);

    //await Hive.box<EmployeeModel>(AppConstants.employeeTable).close();

    if (indexWhere != -1) {
      // open box
      await Hive.openBox<EmployeeModel>(AppConstants.employeeTable);
      await Hive.box<EmployeeModel>(AppConstants.employeeTable)
          .deleteAt(indexWhere)
          .then((value) {
        print('Employee deleted successfully');
      });

      // Update the UI to reflect the change
      await getEmployeeList();
    } else {
      // Employee not found, inform the user
      print('Employee with ID ${employee.id} not found.');
    }
  }
}
