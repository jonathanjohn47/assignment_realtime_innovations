// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

List<EmployeeModel> employeeModelFromJson(String str) =>
    List<EmployeeModel>.from(
        json.decode(str).map((x) => EmployeeModel.fromJson(x)));

String employeeModelToJson(List<EmployeeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeModel {
  String employeeName;
  String role;
  DateTime fromDate;
  DateTime? toDate;

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
        "to_date": toDate == null ? "" : toDate!.toIso8601String(),
      };
}

class EmployeeModelHiveAdapter extends TypeAdapter<EmployeeModelHive> {
  @override
  final int typeId = 1;

  @override
  EmployeeModelHive decode(HiveField field) {
    final Map<String, dynamic> map = field.defaultValue as Map<String, dynamic>;
    return EmployeeModelHive(
      employeeName: map['employeeName'],
      role: map['role'],
      fromDate: DateTime.parse(map['fromDate']),
      toDate: map['toDate'] != null ? DateTime.parse(map['toDate']) : null,
    );
  }

  @override
  dynamic encode(EmployeeModelHive employeeModelHive) {
    return {
      'employeeName': employeeModelHive.employeeName,
      'role': employeeModelHive.role,
      'fromDate': employeeModelHive.fromDate.toIso8601String(),
      'toDate': employeeModelHive.toDate?.toIso8601String() ?? '',
    };
  }

  @override
  EmployeeModelHive read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmployeeModelHive(
      employeeName: fields[0] as String,
      role: fields[1] as String,
      fromDate: fields[2] as DateTime,
      toDate: fields[3] != null ? DateTime.parse(fields[3]) : null,
    );
  }

  @override
  void write(BinaryWriter writer, EmployeeModelHive obj) {
    writer.writeByte(4); // number of fields in your model
    writer.writeByte(0);
    writer.write(obj.employeeName);
    writer.writeByte(1);
    writer.write(obj.role);
    writer.writeByte(2);
    writer.write(obj.fromDate);
    if (obj.toDate != null) {
      writer.writeByte(3);
      writer.write(obj.toDate!.toIso8601String());
    } else {
      writer.writeByte(3);
      writer.write(''); // Write an empty string to represent a null value
    }
  }
}

@HiveType(typeId: 0)
class EmployeeModelHive extends HiveObject {
  @HiveField(0)
  String employeeName;
  @HiveField(1)
  String role;
  @HiveField(2)
  DateTime fromDate;
  @HiveField(3)
  DateTime? toDate;

  EmployeeModelHive({
    required this.employeeName,
    required this.role,
    required this.fromDate,
    required this.toDate,
  });
}
