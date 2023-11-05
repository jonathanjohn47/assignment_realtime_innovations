import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import 'add_employee_details_screen.dart';

class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
        elevation: 0,
      ),
      body: Center(
        child: Image.asset('assets/images/Group 5367.png', width: 70.w),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return AddEmployeeDetailsScreen();
            }));
          },
          child: const Icon(Icons.add),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.dp),
          )),
    );
  }
}
