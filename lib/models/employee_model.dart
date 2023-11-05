// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);

import 'dart:convert';

List<EmployeeModel> employeeModelFromJson(String str) =>
    List<EmployeeModel>.from(
        json.decode(str).map((x) => EmployeeModel.fromJson(x)));

String employeeModelToJson(List<EmployeeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeModel {
  String employeeName;
  String role;
  DateTime fromDate;
  DateTime toDate;

  EmployeeModel({
    required this.employeeName,
    required this.role,
    required this.fromDate,
    required this.toDate,
  });

  EmployeeModel copyWith({
    String? employeeName,
    String? role,
    DateTime? fromDate,
    DateTime? toDate,
  }) =>
      EmployeeModel(
        employeeName: employeeName ?? this.employeeName,
        role: role ?? this.role,
        fromDate: fromDate ?? this.fromDate,
        toDate: toDate ?? this.toDate,
      );

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        employeeName: json["employee_name"],
        role: json["role"],
        fromDate: DateTime.parse(json["from_date"]),
        toDate: DateTime.parse(json["to_date"]),
      );

  Map<String, dynamic> toJson() => {
        "employee_name": employeeName,
        "role": role,
        "from_date": fromDate.toIso8601String(),
        "to_date": toDate.toIso8601String(),
      };
}
