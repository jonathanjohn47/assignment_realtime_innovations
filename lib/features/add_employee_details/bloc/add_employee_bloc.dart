import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/employee_model.dart';

class AddEmployeeBloc extends Cubit {
  AddEmployeeBloc(super.initialState);

  void addEmployee(EmployeeModel employee) {
    SharedPreferences.getInstance().then((prefs) {
      var employees = prefs.getStringList('employees') ?? [];
      employees.add(employeeModelToJson([employee]));
      prefs.setStringList('employees', employees);
    });
  }
}
