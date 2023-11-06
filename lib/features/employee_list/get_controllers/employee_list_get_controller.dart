import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../core/app_constants.dart';
import '../../../models/employee_model.dart';

class EmployeeListGetController extends GetxController {
  RxList<EmployeeModelHive> employeeList = <EmployeeModelHive>[].obs;

  void getEmployeeList() async {
    var box = await Hive.openBox<EmployeeModelHive>(AppConstants.employeeTable);
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
}
