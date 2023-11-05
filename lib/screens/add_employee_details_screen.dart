import 'package:assignment_realtime_innovations/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class AddEmployeeDetailsScreen extends StatelessWidget {
  const AddEmployeeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee Details'),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.dp),
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Employee Name',
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: AppColors.primary,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.dp),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    //width: 0.2.dp,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.dp),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300.withOpacity(0.5),
                    width: 0.2.dp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.dp),
            GestureDetector(
              onTap: () {},
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  labelText: 'Select Role',
                  prefixIcon: Icon(
                    Icons.work_outline,
                    color: AppColors.primary,
                  ),
                  suffixIcon: Icon(
                    Icons.arrow_drop_down_rounded,
                    color: AppColors.primary,
                    size: 32.dp,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.dp),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.dp),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                      //width: 0.2.dp,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.dp),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        labelText: 'No Date',
                        prefixIcon: Icon(
                          Icons.calendar_month_outlined,
                          color: AppColors.primary,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.dp),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.dp),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            //width: 0.2.dp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Icon(Icons.arrow_right_alt,
                    color: AppColors.primary, size: 24.dp),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        labelText: 'No Date',
                        prefixIcon: Icon(
                          Icons.calendar_month_outlined,
                          color: AppColors.primary,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.dp),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.dp),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            //width: 0.2.dp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            thickness: 1.dp,
            color: Colors.grey.shade300,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.dp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary.shade50.withOpacity(0.5),
                    foregroundColor: AppColors.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.dp),
                    ),
                  ),
                ),
                SizedBox(width: 8.dp),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Save'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.dp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
