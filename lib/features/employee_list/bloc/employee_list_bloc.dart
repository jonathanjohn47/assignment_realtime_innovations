import 'dart:convert';

import 'package:assignment_realtime_innovations/models/employee_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeeListBloc extends Cubit<List<EmployeeModel>> {
  EmployeeListBloc() : super([]);

  Future<List<EmployeeModel>> _getAllEmployees() async {
    var prefs = await SharedPreferences.getInstance();
    var employees = prefs.getStringList('employees') ?? [];
    return employees.map((e) => EmployeeModel.fromJson(jsonDecode(e))).toList();
  }

  Future<void> getAllEmployees() async {
    var employees = await _getAllEmployees();
    emit(employees);
  }
}
