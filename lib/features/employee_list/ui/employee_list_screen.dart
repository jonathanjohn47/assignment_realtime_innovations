import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../models/employee_model.dart';
import '../../add_employee_details/ui/add_employee_details_screen.dart';
import '../bloc/employee_list_bloc.dart';

class EmployeeListScreen extends StatelessWidget {
  EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => EmployeeListBloc()..getAllEmployees(),
        child: BlocBuilder<EmployeeListBloc, List<EmployeeModel>>(
            builder: (context, state) {
          return state.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    var employee = state[index];
                    return ListTile(
                      title: Text(employee.employeeName),
                      subtitle: Text(employee.role),
                      trailing: Text(
                          '${employee.fromDate.day}/${employee.fromDate.month}/${employee.fromDate.year} - ${employee.toDate.day}/${employee.toDate.month}/${employee.toDate.year}'),
                    );
                  },
                  itemCount: state.length,
                )
              : Center(
                  child:
                      Image.asset('assets/images/Group 5367.png', width: 70.w),
                );
        }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return AddEmployeeDetailsScreen();
            }));
          },
          child: Icon(Icons.add),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.dp),
          )),
    );
  }
}
