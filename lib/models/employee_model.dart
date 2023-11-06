// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'employee_model.g.dart';

List<EmployeeModel> employeeModelFromJson(String str) =>
    List<EmployeeModel>.from(
        json.decode(str).map((x) => EmployeeModel.fromJson(x)));

String employeeModelToJson(List<EmployeeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 0)
class EmployeeModel {
  @HiveField(0)
  int id;

  @HiveField(1)
  String employeeName;

  @HiveField(2)
  String role;

  @HiveField(3)
  DateTime fromDate;

  @HiveField(4)
  DateTime toDate;

  @HiveField(5)
  bool currentEmployee;

  EmployeeModel({
    required this.id,
    required this.employeeName,
    required this.role,
    required this.fromDate,
    required this.toDate,
    required this.currentEmployee,
  });

  EmployeeModel copyWith({
    int? id,
    String? employeeName,
    String? role,
    DateTime? fromDate,
    DateTime? toDate,
    bool? currentEmployee,
  }) =>
      EmployeeModel(
        id: id ?? this.id,
        employeeName: employeeName ?? this.employeeName,
        role: role ?? this.role,
        fromDate: fromDate ?? this.fromDate,
        toDate: toDate ?? this.toDate,
        currentEmployee: currentEmployee ?? this.currentEmployee,
      );

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json["id"],
        employeeName: json["employee_name"],
        role: json["role"],
        fromDate: DateTime.parse(json["from_date"]),
        toDate: DateTime.parse(json["to_date"]),
        currentEmployee: json["current_employee"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "employee_name": employeeName,
        "role": role,
        "from_date": fromDate.toIso8601String(),
        "to_date": toDate.toIso8601String(),
        "current_employee": currentEmployee,
      };
}
